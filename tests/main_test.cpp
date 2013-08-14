#include "gtest/gtest.h"

#include "cpputils/cpplogger/cpplogger.h"

class ClassLoaderTestEnvironment : public ::testing::Environment 
{
    public:

    virtual void SetUp()
    {
        cpputils::cpplogger::LogManager::Init("ClassLoader", 
            "logging_config_file");

        std::cout << "[   INFO   ]" <<
            " Global environment setup called." << std::endl;
    }

    virtual void TearDown()
    {
        cpputils::cpplogger::LogManager::CleanUp();
        std::cout << "[   INFO   ]" <<
            " Global environment teardown called." << std::endl;
    }
};

int main(int argc, char** argv) {
  ::testing::InitGoogleTest(&argc, argv);
  ::testing::FLAGS_gtest_death_test_style = "fast";
  
  
  ::testing::AddGlobalTestEnvironment(new ClassLoaderTestEnvironment);

  return RUN_ALL_TESTS();
}
