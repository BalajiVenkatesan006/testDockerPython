import unittest
import sys
import os
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
from app import hello

class TestFlaskApp(unittest.TestCase):
    def test_flask_app_function(self):
        result = hello()
        self.assertTrue(result == "Hello world! ", "correct Computation")

if __name__ == "__main__":
    unittest.main()

# import unittest
# import sys
# import os

# sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
# from app import app

# class TestFlaskApp(unittest.TestCase):
#     def test_flask_app_function(self):
#         client = app.test_client()
#         response = client.get('/')
#         self.assertEqual(response.data.decode('utf-8'), 'Hello world!', "Correct computation")

# if __name__ == "__main__":
#     unittest.main()

