json.name @json_keg.name
json.start_date @json_keg.start_date
json.start_pints (@json_keg.volume * 8)
json.last_pints  @json_weight.get_beer_count
