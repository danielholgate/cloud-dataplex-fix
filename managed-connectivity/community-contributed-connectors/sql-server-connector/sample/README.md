# Sample Metadata Import File
This directory contains:
 * A sample metadata file generated by the connector: [sqlserver-output.jsonl](sqlserver-output.jsonl)
 * A request to use with the Metadata Import REST API: [metadata_import_request.json](metadata_import_request.json)
### To import metadata into the BigQuery Unified Catalog:

* In [sqlserver-output.jsonl](sqlserver-output.jsonl): 
    1. Search and replace all instances of "the-gcp-project" with your project ID
    2. [OPTIONAL] Search and replace all instances of "us-central1" with your region or with "global" 
    3. Upload the .jsonl metadata import file to a Google Cloud Storage bucket

* In [metadata_import_request.json](metadata_import_request.json):
    1. Replace the value in source_storage_uri with the path to your GCS bucket from above (Note: without the file and ending with /)
    2. Replace "the-gcp-project" with your project ID
    3. Go to the Dataplex UI. Ensure the Entry Group, Entry Types and Aspect Types seen in metadata_import_reques exist in your project
        Note: projects/dataplex-types/locations/global/aspectTypes/schema is a built-in Aspect Type and does not need to be created.

Run import via the REST Metadata Impport API, replacing the-project-id below for your project:

```bash
curl -X POST -H "Authorization: Bearer $(gcloud auth print-access-token)" \
-H "Content-Type: application/json; charset=utf-8" \
-d @metadata_import_request.json \
"https://dataplex.googleapis.com/v1/projects/the-project-id/locations/us-central1/metadataJobs?metadataJobId=a001"
```

For more details about the Metadata Import Process see [the documentation](https://cloud.google.com/dataplex/docs/import-metadata#import-metadata)