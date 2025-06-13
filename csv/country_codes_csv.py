from dataflows import Flow, load, dump_to_path, dump_to_zip, printer, add_metadata
from dataflows import sort_rows, filter_rows, find_replace, delete_fields, set_type, validate, unpivot




def country_codes_csv():
    flow = Flow(
        # Load inputs
        load('country_codes.csv', format='csv', ),
        # Process them (if necessary)
        # Save the results
        add_metadata(name='country_codes_csv', title='''country_codes.csv'''),
        printer(),
        dump_to_path('country_codes_csv'),
    )
    flow.process()


if __name__ == '__main__':
    country_codes_csv()