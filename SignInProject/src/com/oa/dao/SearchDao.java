package com.oa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLTimeoutException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.concurrent.ThreadLocalRandom;

import com.oa.helpers.Address;
import com.oa.helpers.Auction;
import com.oa.helpers.Bid;
import com.oa.helpers.ProductItem;
import com.oa.helpers.User;
import com.oa.utilities.Encryption;
import com.oa.utilities.Mailer;

//toDo: need to add category table and categoryId
/**
 * @author Julie
 *
 */
public class SearchDao {
	/**
	 * @param keyword
	 * @return productItem
	 */

	public static ArrayList<ProductItem> searchKeyword(String keyword) {
		Connection conn = Dao.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		ArrayList<ProductItem> productItems = null;

		// Todo: need to check auction table first
		try {
			pst = conn.prepareStatement("select * from items ORDER BY items.itemname ASC");

			if (keyword != null && !keyword.isEmpty()) {
				pst = conn.prepareStatement(
						"select * from items WHERE " + "itemname REGEXP '[[:<:]]" + keyword + "[[:>:]]' "
								+ "OR description REGEXP '[[:<:]]" + keyword + "[[:>:]]' ORDER BY items.itemname ASC");

			}
			// pst.setString(1, keyword);

			rs = pst.executeQuery();
			int size = 0;
			if (rs != null) {
				rs.beforeFirst();
				rs.last();
				size = rs.getRow();
			}

			rs.beforeFirst();
			int i = 0;
			productItems = new ArrayList<ProductItem>();
			while (rs.next() && i < size) {

				ProductItem productItem = new ProductItem();

				productItem.setProductId(rs.getString("id"));
				productItem.setItemName(rs.getString("itemname"));
				productItem.setDesciption(rs.getString("description"));
				// productItem.setDateCreated(rs.getString("date_created"));
				// productItem.setDateModified(rs.getString("date_modified"));
				productItem.setImage(rs.getString("image"));

				// productItem.setHighestPrice(getHestPriceByProductItemID(productItem.getProductId()));
				/*
				 * // highestPrice pst2 =
				 * conn.prepareStatement("select i.itemname, a.bid_end_time, b.bid_price " +
				 * "from items i,auctions a, bids b where b.auctions_fk = a.id " +
				 * "AND a.items_fk = i.id AND i.id = " + productItem.getProductId()+
				 * "  order by  b.bid_price DESC Limit 1"); rs2 = pst2.executeQuery();
				 * if(rs2.next()) { productItem.setHighestPrice(rs2.getString("bid_price")); }
				 * else { productItem.setHighestPrice("0.00"); } pst2.close(); // lowestPrice
				 * pst2 =
				 * conn.prepareStatement("select i.itemname, a.bid_end_time, b.bid_price " +
				 * "from items i,auctions a, bids b where b.auctions_fk = a.id " +
				 * "AND a.items_fk = i.id AND i.id = " + productItem.getProductId()+
				 * "  order by  b.bid_price ASC Limit 1"); rs2 = pst2.executeQuery();
				 * if(rs2.next()) { productItem.setLowestPrice(rs2.getString("bid_price")); }
				 * else { productItem.setLowestPrice("99999.00"); } // Auction
				 * productItem.setBids(getBids(productItem.getProductId()));
				 * 
				 * // bids productItem.setBids(getBids(productItem.getProductId()));
				 * 
				 */

				productItems.add(productItem);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				Dao.closeConnection();
			}
			if (pst != null) {
				try {
					pst.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

		}

		if (null != productItems) {
			for (ProductItem productitem : productItems) {
				productitem.setHighestPrice(getHighestPriceByProductItemID(productitem.getProductId()));
				productitem.setLowestPrice(getLowestPriceByProductItemID(productitem.getProductId()));

				Auction auction = new Auction();
				auction = getAuctionByProductItemID(productitem.getProductId());
				productitem.setAuction(auction);

				Bid currentbid = new Bid();
				ArrayList<Bid> bids = new ArrayList<Bid>();
				bids = getBidsByProductID(productitem.getProductId());
				productitem.setBids(bids);
				if (bids.size() > 0) {
					currentbid = bids.get(0);
					productitem.setCurrentbid(currentbid);
				}
			}
		}
		return productItems;
	}

	public static ArrayList<ProductItem> sortBy(String keyword, String sortMethod) {
		ArrayList<ProductItem> productItems = null;

		productItems = searchKeyword(keyword);
		switch (sortMethod) {
		case "name":
			return productItems;

		case "highestprice":
			Collections.sort(productItems, COMPARATOR_highestprice);
			return productItems;

		case "lowestprice":
			Collections.sort(productItems, COMPARATOR_lowestprice);
			return productItems;
		case "mostbids":
			Collections.sort(productItems, COMPARATOR_mostbids);
			break;
		case "leastbids":
			Collections.sort(productItems, COMPARATOR_leastbids);
			break;
		case "newestauction":
			Collections.sort(productItems, COMPARATOR_newestauction);
			break;
		case "oldestauction":
			Collections.sort(productItems, COMPARATOR_oldestauction);
			break;
		default:
			break;

		}

		return productItems;

	}

	private static Comparator<ProductItem> COMPARATOR_newestauction = new Comparator<ProductItem>() {
		// This is where the sorting happens.
		public int compare(ProductItem o1, ProductItem o2) {
			if (o1.getAuction().getDateCreated().compareTo(o2.getAuction().getDateCreated()) == 1) {
				return 1;
			}
			return -1;

			// return o1.getHighestPrice() - o2.getHighestPrice();
		}
	};

	private static Comparator<ProductItem> COMPARATOR_oldestauction = new Comparator<ProductItem>() {
		// This is where the sorting happens.
		public int compare(ProductItem o1, ProductItem o2) {
			if (o1.getAuction().getDateCreated().compareTo(o2.getAuction().getDateCreated()) == -1) {
				return 1;
			}
			return -1;

			// return o1.getHighestPrice() - o2.getHighestPrice();
		}
	};

	private static Comparator<ProductItem> COMPARATOR_mostbids = new Comparator<ProductItem>() {
		// This is where the sorting happens.
		public int compare(ProductItem o1, ProductItem o2) {
			if (o1.getBids().size() < o2.getBids().size()) {
				return 1;

			}
			return -1;

			// return o1.getHighestPrice() - o2.getHighestPrice();
		}
	};

	private static Comparator<ProductItem> COMPARATOR_leastbids = new Comparator<ProductItem>() {
		// This is where the sorting happens.
		public int compare(ProductItem o1, ProductItem o2) {
			if (o1.getBids().size() > o2.getBids().size()) {
				return 1;

			}
			return -1;

			// return o1.getHighestPrice() - o2.getHighestPrice();
		}
	};

	private static Comparator<ProductItem> COMPARATOR_highestprice = new Comparator<ProductItem>() {
		// This is where the sorting happens.
		public int compare(ProductItem o1, ProductItem o2) {
			if (Float.parseFloat(o1.getHighestPrice()) < Float.parseFloat(o2.getHighestPrice())) {
				return 1;

			}
			return -1;

			// return o1.getHighestPrice() - o2.getHighestPrice();
		}
	};

	private static Comparator<ProductItem> COMPARATOR_lowestprice = new Comparator<ProductItem>() {
		// This is where the sorting happens.
		public int compare(ProductItem o1, ProductItem o2) {
			if (Float.parseFloat(o1.getHighestPrice()) > Float.parseFloat(o2.getHighestPrice())) {
				return 1;

			}
			return -1;

			// return o1.getHighestPrice() - o2.getHighestPrice();
		}
	};

	/////

	public static String getHighestPriceByProductItemID(String productitemid) {
		Connection conn = Dao.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		ProductItem productitem = null;
		// highestPrice
		try {
			pst = conn.prepareStatement("select i.itemname, a.bid_end_time, b.bid_price "
					+ "from items i,auctions a, bids b where b.auctions_fk = a.id "
					+ "AND a.items_fk = i.id AND i.id = " + productitemid + "  order by  b.bid_price DESC Limit 1");
			rs = pst.executeQuery();
			if (rs.next()) {
				return rs.getString("bid_price");
			} else {
				return "0.00";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				Dao.closeConnection();
			}
			if (pst != null) {
				try {
					pst.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

		}
		return "failed";
	}

	public static String getLowestPriceByProductItemID(String productitemid) {
		Connection conn = Dao.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		ProductItem productitem = null;
		// highestPrice
		try {
			pst = conn.prepareStatement("select i.itemname, a.bid_end_time, b.bid_price "
					+ "from items i,auctions a, bids b where b.auctions_fk = a.id "
					+ "AND a.items_fk = i.id AND i.id = " + productitemid + "  order by  b.bid_price ASC Limit 1");
			rs = pst.executeQuery();
			if (rs.next()) {
				return rs.getString("bid_price");
			} else {
				return "0.00";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				Dao.closeConnection();
			}
			if (pst != null) {
				try {
					pst.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

		}
		return "failed";
	}

	////

	public static ProductItem getProductItemByID(String productitemid) {
		Connection conn = Dao.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		ProductItem productitem = null;

		// Todo: need to check auction table first
		try {
			pst = conn.prepareStatement("select * from items WHERE id=?");
			pst.setString(1, productitemid);

			rs = pst.executeQuery();
			int size = 0;
			if (rs != null) {
				rs.beforeFirst();
				rs.last();
				size = rs.getRow();
			}

			rs.beforeFirst();
			int i = 0;
			productitem = new ProductItem();
			while (rs.next() && i < size) {
				productitem.setProductId(rs.getString("id"));
				productitem.setItemName(rs.getString("itemname"));
				productitem.setDesciption(rs.getString("description"));
				// productitem.setDateCreated(rs.getString("date_created"));
				// productitem.setDateModified(rs.getString("date_modified"));
				productitem.setImage(rs.getString("image"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				Dao.closeConnection();
			}
			if (pst != null) {
				try {
					pst.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

		}

		System.out.print("aaaaaaaaaaaaaaa. \n");
		productitem.setHighestPrice(getHighestPriceByProductItemID(productitem.getProductId()));
		productitem.setLowestPrice(getLowestPriceByProductItemID(productitem.getProductId()));

		Auction auction = new Auction();
		auction = getAuctionByProductItemID(productitem.getProductId());

		productitem.setAuction(auction);

		Bid currentbid = new Bid();
		ArrayList<Bid> bids = new ArrayList<Bid>();
		bids = getBidsByProductID(productitem.getProductId());
		productitem.setBids(bids);
		if (bids.size() > 0) {
			currentbid = bids.get(0);
			productitem.setCurrentbid(currentbid);
		}

		return productitem;
	}

	public static Auction getAuctionByProductItemID(String productitemid) {
		Connection conn = Dao.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		Auction auction = new Auction();
		auction.setDateCreated("0000-00-0000 00:00:00");

		// Todo: need to check auction table first
		try {
			pst = conn.prepareStatement("select * from auctions WHERE items_fk=" + productitemid);
			// pst.setString(1, productitemid);

			rs = pst.executeQuery();
			int size = 0;
			if (rs != null) {
				rs.beforeFirst();
				rs.last();
				size = rs.getRow();
			}

			rs.beforeFirst();
			int i = 0;
			// auction = new Auction();
			while (rs.next() && i < size) {
				// id,bid_start_time,bid_end_time,bid_price_start,bid_price_max,description
				// ,items_fk,user_id,dateCreated,date_modified,bid_state

				auction.setId(rs.getString("id"));
				auction.setBidstarttime(rs.getString("bid_start_time"));
				auction.setBidendtime(rs.getString("bid_end_time"));
				auction.setBidpricestart(rs.getString("bid_price_start"));
				auction.setBidpricemax(rs.getString("bid_price_max"));
				auction.setDescription(rs.getString("description"));
				auction.setItemsfk(rs.getString("items_fk"));
				auction.setUserid(rs.getString("user_id"));
				auction.setDateCreated(rs.getString("date_created"));
				// auction.setDatemodified(rs.getString("date_modified"));
				auction.setBidstate(rs.getString("bid_state"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				Dao.closeConnection();
			}
			if (pst != null) {
				try {
					pst.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

		}
		return auction;
	}

	public static ArrayList<Bid> getBidsByProductID(String productitemid) {
		Connection conn = Dao.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		ArrayList<Bid> bids = null;

		// Todo: need to check auction table first
		try {
			pst = conn.prepareStatement("select b.* from bids b, auctions a, items i where "
					+ " b.auctions_fk = a.id and a.items_fk = i.id and i.id=? order by b.date_created");
			pst.setString(1, productitemid);

			rs = pst.executeQuery();
			int size = 0;
			if (rs != null) {
				rs.beforeFirst();
				rs.last();
				size = rs.getRow();
			}

			rs.beforeFirst();
			int i = 0;
			bids = new ArrayList<Bid>();
			while (rs.next() && i < size) {

				Bid bid = new Bid();

				bid.setId(rs.getString("id"));
				bid.setBidprice(rs.getString("bid_price"));
				bid.setAuctionid(rs.getString("auctions_fk"));
				bid.setUserid(rs.getString("users_fk"));
				bid.setDateCreated(rs.getString("date_created"));

				// get user by user_id
				// User user = new User();
				// user = getUserByUserID(bid.getUserid());
				// bid.setUser(user);
				/*
				 * // get auction by auction_id pst =
				 * conn.prepareStatement("select * from auctions where id=?"); pst.setString(1,
				 * bid.getAuctionid()); rs2 = pst.executeQuery(); if(rs2.next()) { Auction
				 * auction = new Auction(); auction.setId(rs.getString("id"));
				 * auction.setBidstarttime(rs.getString("bid_start_time"));
				 * auction.setBidendtime(rs.getString("bid_end_time"));
				 * auction.setBidpricestart(rs.getString("bid_price_start"));
				 * auction.setBidpricemax(rs.getString("bid_price_max"));
				 * auction.setDescription(rs.getString("description"));
				 * auction.setItemsfk(rs.getString("items_fk"));
				 * auction.setUserid(rs.getString("user_id"));
				 * auction.setDateCreated(rs.getString("dateCreated"));
				 * //auction.setDatemodified(rs.getString("date_modified"));
				 * auction.setBidstate(rs.getString("bid_state"));
				 * 
				 * bid.setAuction(auction); } else { // } // get user by user_id pst =
				 * conn.prepareStatement("select * from users where id=?"); pst.setString(1,
				 * bid.getUserid()); rs2 = pst.executeQuery(); if(rs2.next()) { User user = new
				 * User(); user.setUserId(rs.getString("id"));
				 * user.setFirstname(rs.getString("firstname"));
				 * user.setLastname(rs.getString("lastname"));
				 * user.setUsername(rs.getString("username"));
				 * user.setPassword(rs.getString("password"));
				 * user.setEmail(rs.getString("email"));
				 * user.setVerificationCode(rs.getString("verification_code"));
				 * user.setVerificationState(Integer.parseInt(rs.getString("verified_state")));
				 * // get address user_id pst =
				 * conn.prepareStatement("select * from users where id=?"); pst.setString(1,
				 * bid.getUserid()); rs2 = pst.executeQuery(); if(rs2.next()) { Address address
				 * = new Address(); address.setId(rs.getString("id"));
				 * address.setCity(rs.getString("city"));
				 * address.setPostalcode(rs.getString("postal_code"));
				 * address.setAddress(rs.getString("address"));
				 * address.setDatecreated(rs.getString("date_created"));
				 * address.setDatemodified(rs.getString("date_modified"));
				 * 
				 * user.setAddress(address);
				 * 
				 * } else { // }
				 * 
				 * bid.setUser(user); } else { // }
				 */

				bids.add(bid);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				Dao.closeConnection();
			}
			if (pst != null) {
				try {
					pst.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

		}

		for (Bid bid : bids) {
			User user = getUserByUserID(bid.getUserid());
			bid.setUser(user);
		}

		return bids;
	}

	/////////////
	public static User getUserByUserID(String userid) {
		Connection conn = Dao.getConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		User user = new User();
		// auction.setDateCreated("0000-00-0000 00:00:00");
		// System.out.print("nnnnnnnnnn=" + userid + "\n");
		// Todo: need to check auction table first
		try {
			pst = conn.prepareStatement("select * from users WHERE id=" + userid);
			// pst.setString(1, productitemid);

			rs = pst.executeQuery();
			int size = 0;
			if (rs != null) {
				rs.beforeFirst();
				rs.last();
				size = rs.getRow();
			}

			rs.beforeFirst();
			int i = 0;
			// auction = new Auction();
			while (rs.next() && i < size) {
				// id,bid_start_time,bid_end_time,bid_price_start,bid_price_max,description
				// ,items_fk,user_id,dateCreated,date_modified,bid_state

				user.setUserId(rs.getString("id"));
				user.setFirstname(rs.getString("firstname"));
				user.setLastname(rs.getString("lastname"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setEmail(rs.getString("email"));
				user.setVerificationCode(rs.getString("verification_code"));
				user.setVerificationState(Integer.parseInt(rs.getString("verified_state")));

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				Dao.closeConnection();
			}
			if (pst != null) {
				try {
					pst.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

		}
		return user;
	}

	// to remove
	/*
	 * public static Auction getAuction(String productitemid){ Connection conn =
	 * Dao.getConnection(); PreparedStatement pst = null; ResultSet rs = null;
	 * ResultSet rs2 = null; Auction auction= null;
	 * 
	 * //Todo: need to check auction table first try{ pst =
	 * conn.prepareStatement("select * from auction where items_fk=?");
	 * pst.setString(1, productitemid);
	 * 
	 * rs = pst.executeQuery(); int size =0; if (rs != null) { rs.beforeFirst();
	 * rs.last(); size = rs.getRow(); }
	 * 
	 * 
	 * rs.beforeFirst(); int i = 0; auction = new Auction(); while(rs.next() &&
	 * i<size){ auction.setId(rs.getString("id"));
	 * auction.setBidstarttime(rs.getString("bid_start_time"));
	 * auction.setBidendtime(rs.getString("bid_end_time"));
	 * auction.setBidpricestart(rs.getString("bid_price_start"));
	 * auction.setBidpricemax(rs.getString("bid_price_max"));
	 * auction.setDescription(rs.getString("description"));
	 * auction.setItemsfk(rs.getString("items_fk"));
	 * auction.setUserid(rs.getString("user_id"));
	 * auction.setDateCreated(rs.getString("dateCreated"));
	 * auction.setDatemodified(rs.getString("date_modified"));
	 * auction.setBidstate(rs.getString("bid_state"));
	 * 
	 * 
	 * // get user by user_id pst =
	 * conn.prepareStatement("select * from users where id=?"); pst.setString(1,
	 * auction.getUserid()); rs2 = pst.executeQuery(); if(rs2.next()) { User user =
	 * new User(); user.setUserId(rs.getString("id"));
	 * user.setFirstname(rs.getString("firstname"));
	 * user.setLastname(rs.getString("lastname"));
	 * user.setUsername(rs.getString("username"));
	 * user.setPassword(rs.getString("password"));
	 * user.setEmail(rs.getString("email"));
	 * user.setVerificationCode(rs.getString("verification_code"));
	 * user.setVerificationState(Integer.parseInt(rs.getString("verified_state")));
	 * // get address user_id pst =
	 * conn.prepareStatement("select * from users where id=?"); pst.setString(1,
	 * user.getUserId()); rs2 = pst.executeQuery(); if(rs2.next()) { Address address
	 * = new Address(); address.setId(rs.getString("id"));
	 * address.setCity(rs.getString("city"));
	 * address.setPostalcode(rs.getString("postal_code"));
	 * address.setAddress(rs.getString("address"));
	 * address.setDatecreated(rs.getString("date_created"));
	 * address.setDatemodified(rs.getString("date_modified"));
	 * 
	 * user.setAddress(address);
	 * 
	 * } else { // }
	 * 
	 * auction.setUser(user); } else { // }
	 * 
	 * 
	 * 
	 * 
	 * }
	 * 
	 * 
	 * }catch (Exception e) { e.printStackTrace(); } finally { if (conn != null) {
	 * Dao.closeConnection(); } if (pst != null) { try { pst.close(); } catch
	 * (SQLException e) { e.printStackTrace(); } } if (rs != null) { try {
	 * rs.close(); } catch (SQLException e) { e.printStackTrace(); } }
	 * 
	 * if (rs2 != null) { try { rs2.close(); } catch (SQLException e) {
	 * e.printStackTrace(); } } }
	 * 
	 * return auction; }
	 */

}// End of SearchDao
