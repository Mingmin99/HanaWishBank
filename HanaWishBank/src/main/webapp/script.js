document.addEventListener("DOMContentLoaded", function() {
	const searchButton = document.getElementById("search-button");
	const searchQuery = document.getElementById("search-query");
	const searchResults = document.getElementById("search-results");

	searchButton.addEventListener("click", function() {
		const query = searchQuery.value;

		// 프록시 서블릿의 URL 설정
		const proxyUrl = "http://localhost:8080/HanaWishBank/ProxyServlet"; // 프록시 서블릿의 URL로 변경해야 함

		fetch(`${proxyUrl}?query=${query}`, {
			method: "GET"
		})
			.then(response => response.json())
			.then(data => displayResults(data.items))
			.catch(error => console.error("API 호출 에러: " + error));
	});

	function displayResults(items) {
		searchResults.innerHTML = "";

		items.forEach(item => {
			const resultItem = document.createElement("div");
			resultItem.classList.add("result-item");

			const image = document.createElement("img");
			image.src = item.image;

			const title = document.createElement("h3");
			title.textContent = item.title;

			const price = document.createElement("p");
			price.textContent = item.lprice + "원";

			resultItem.appendChild(image);
			resultItem.appendChild(title);
			resultItem.appendChild(price);

			searchResults.appendChild(resultItem);
		});
	}
});
