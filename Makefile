compile:
	@make depend
	@rm -Rf ebin
	@mkdir ebin
	@erlc -W0 -pa deps/sheriff/ebin -o ebin src/*.erl  

depend:
	@rm -Rf deps/parse_trans/ebin
	@mkdir deps/parse_trans/ebin
	@erlc -W0 -o deps/parse_trans/ebin deps/parse_trans/src/*.erl 
	@rm -Rf deps/sheriff/ebin
	@mkdir deps/sheriff/ebin
	@erlc -W0 -pa deps/parse_trans/ebin -o deps/sheriff/ebin deps/sheriff/src/*.erl

# Test cases

run_bridge_fair:
	@scripts/edbc_erlc "examples/bridge/fair/src/*.erl" examples/bridge/fair/ebin
	@scripts/edbc_erl examples/bridge/fair/ebin "bridge_test:test()"

run_bridge_unfair:
	@scripts/edbc_erlc "examples/bridge/unfair/src/*.erl" examples/bridge/unfair/ebin
	@scripts/edbc_erl examples/bridge/unfair/ebin "bridge_test:test()"

load_ej1:
	@scripts/edbc_erlc examples/other/src/ej1.erl examples/other/ebin
	@scripts/edbc_erl examples/other/ebin 

load_ej1_noedbc:
	@scripts/edbc_erlcp examples/other/src/ej1.erl examples/other/ebin
	@scripts/edbc_erl examples/other/ebin 

doc_ej1:
	@scripts/edbc_edoc examples/other/src/ej1.erl examples/other/docs

run_library:
	@scripts/edbc_erlc "examples/other/src/library*.erl" examples/other/ebin
	@scripts/edbc_erl examples/other/ebin "library_test:test1()"

run_rw_unfair4writers:
	@scripts/edbc_erlc "examples/readers_writers/unfair4writers/src/*.erl" examples/readers_writers/unfair4writers/ebin
	@scripts/edbc_erl examples/readers_writers/unfair4writers/ebin "readers_writers_test:test()"

run_rw_unfair4readers:
	@scripts/edbc_erlc "examples/readers_writers/unfair4readers/src/*.erl" examples/readers_writers/unfair4readers/ebin
	@scripts/edbc_erl examples/readers_writers/unfair4readers/ebin "readers_writers_test:test()"

run_rw_fair:
	@scripts/edbc_erlc "examples/readers_writers/fair/src/*.erl" examples/readers_writers/fair/ebin
	@scripts/edbc_erl examples/readers_writers/fair/ebin "readers_writers_test:test()"

test_semaphore:
	@scripts/edbc_erlc "examples/semaphore/src/*.erl" examples/semaphore/ebin
	@scripts/edbc_erl examples/semaphore/ebin "semaphore_tests:test()"


