$(document).ready(function() {
  $("#match_match_participations_attributes_0_winner").click()
  $("[id^=match_match_participations_attributes_][id$=winner]").click(function(event) {
    var caller = $("#" + event.target.id)
    var blackId = 'match_match_participations_attributes_0_winner'
    var whiteId = 'match_match_participations_attributes_1_winner'
    var bothIds = [blackId, whiteId]

    var nonCallerId = bothIds.filter(function(id){return id !== event.target.id})[0]
    var nonCaller = $("#" + nonCallerId)

    if (caller.prop("checked") ==  nonCaller.prop("checked")) {
      nonCaller.prop("checked", !nonCaller.prop("checked"));
    }
  });
});

