#@load policy/tuning/json-logs.bro

@unload frameworks/files/extract-all-files.bro
@unload frameworks/files/hash-all-files.bro

redef Files::analyze_by_mime_type_automatically = F;

event file_new(f: fa_file)
{
	Files::remove_analyzer(f, Files::ANALYZER_EXTRACT);
}

event file_sniff(f: fa_file, meta: fa_metadata)
{
	if ( ! f?$source || f$source != "HTTP" ) {
		return;
	}

	if ( ! meta?$mime_type ) {
		return;
	}

	if ( meta$mime_type == "text/html" ) {
		return;
	} else {
		Files::add_analyzer(f, Files::ANALYZER_EXTRACT);
		Files::add_analyzer(f, Files::ANALYZER_SHA256);
	}
}

event file_state_remove(f: fa_file) {
	if ( ! f?$source || f$source != "HTTP" ) {
		return;
	}
}

