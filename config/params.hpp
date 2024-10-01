// A parameter
class example_param
{
    title = "example_param";
    values[] = {0, 1};
    texts[] = {"False", "True"};
    default = 0;
};

// A way to trick Arma into displaying a description for the previous parameter
class example_param_desc
{
    title = "Example Parameter Description Example";
    values[] = {""};
    texts[] = {""};
    default = "";
};

// Spacer example (puts a space AND ALSO sets up initial class for reuse)
class Spacer0
{
    title = "";
    values[] = {""};
    texts[] = {""};
    default = "";
};

// Second spacer example
class Spacer1 : Spacer0 {};
