
$("#searchForm").submit(function(e) {
    e.preventDefault();
    var results = $("#resultContainer");
    var text = $("#search").val();
    results.empty();
    $.get("https://itunes.apple.com/search", function(data) {
        results.append($(data).find("div:contains(" + text + ")"));
    });
});


function appendResults(html){
    var resultsContainer = $("#results");
    resultsContainer.empty();
    resultsContainer.append(html);
}
