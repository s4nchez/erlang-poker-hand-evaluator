-module(erlang_poker_hand_evaluator).

%% API exports
-export([]).


%%====================================================================
%% API functions
%%====================================================================


%%====================================================================
%% Internal functions
%%====================================================================

suit_values() -> #{ "♠" => 1, "♥" => 2, "♦" => 4, "♣" => 8 }.

face_values() -> #{
  "2" => #{prime => 2,  index => 0},
  "3" => #{prime => 3,  index => 1},
  "4" => #{prime => 5,  index => 2},
  "5" => #{prime => 7,  index => 3},
  "6" => #{prime => 11, index => 4},
  "7" => #{prime => 13, index => 5},
  "8" => #{prime => 17, index => 6},
  "9" => #{prime => 19, index => 7},
  "T" => #{prime => 23, index => 8},
  "J" => #{prime => 29, index => 9},
  "Q" => #{prime => 31, index => 10},
  "K" => #{prime => 37, index => 11},
  "A" => #{prime => 41, index => 12}
}.

face_details(Face) -> maps:get(Face, face_values()).

card_value(Face, Suit) ->
  Details = face_details(Face),
  Prime = maps:get(prime, Details),
  FaceValue = maps:get(index, Details),
  SuitValue = maps:get(Suit, suit_values()),
  <<Prime>>.

%%====================================================================
%% Tests
%%====================================================================

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

-ifdef(TEST).

base2_str(CardBits) -> lists:concat(io_lib:format("~.2B", binary_to_list(CardBits))).

card_representation_test() ->
  ?assert("100101" == base2_str(card_value("K", "♦"))).

-endif.