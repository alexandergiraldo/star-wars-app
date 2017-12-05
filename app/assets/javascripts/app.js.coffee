
$(".select-sw-character").select2
  width: '68%',
  placeholder: "Search a Character",
  minimumInputLength: 2,
  ajax:
    url: (params) ->
      'https://swapi.co/api/people/?format=json&search=' + params.term
    dataType: 'json',
    processResults: (data) ->
      results: $.map data.results, (obj) ->
        id: obj.url
        text: obj.name

  formatResult: (item, page) ->
    item.name

$('.select-sw-character').on 'select2:select', (e) ->
  $(this).parents('form').submit();
