#include <iostream>

#include <hocon/config.hpp>

using namespace std;
using namespace hocon;

int main() {
    auto conf = config::parse_file_any_syntax("../test.conf")->resolve();
    cout << conf->root()->render() << endl;
    return 0;
}
