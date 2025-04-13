import logging

logging.basicConfig(
    filename='system.log',
    level=logging.DEBUG,
    format='%(asctime)s-%(levelname)s-%(message)s'
)

#log some messages

logging.info("System initialized")
logging.info("User login successful")
logging.error("Running out of memory")
logging.warning("High Memory Usage")
logging.error("Unable to connect to MONGO DB Database")