from etl.extract import extract_all
from etl.transform import transform_all
from etl.load import save_processed_to_csv, save_raw_to_csv


def main():
    raw_data = extract_all()
    transformed_data = transform_all()
    save_raw_to_csv(raw_data)
    save_processed_to_csv(transformed_data)

if __name__ == "__main__":
    main()
