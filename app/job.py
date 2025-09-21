import logging

logging.basicConfig(level=logging.INFO)


def execute_job():
    logging.info("Executing job...")
    return "Job executed successfully"


if __name__ == "__main__":
    job_result = execute_job()

    logging.info(f"Job result: {job_result}")
