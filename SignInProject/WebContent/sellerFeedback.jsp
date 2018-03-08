<h2>Leave ${param.seller} a rating.</h2>

<form method="post" action="sellerFeedbackServlet">
	<table>
		<tr>
			<td>
				Rating (1-5)
			</td>
			<td>
				<input type="range" min="1" max="5" value="5" name="rating">
			</td>
		</tr>
		<tr>
			<td>
				Description
			</td>
			<td>
				<textarea rows="10" name="description"></textarea>
			</td>
		</tr>
		<tr>
			<td><input type="submit"/></td>
		</tr>
	</table>
</form>
