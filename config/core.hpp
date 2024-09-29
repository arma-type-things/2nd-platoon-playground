#include "paradigm.hpp"

// TODO: move to functions.hpp
class CfgFunctions {
	#include "..\paradigm\client\functions.hpp"
	#include "..\paradigm\server\functions.hpp"
	#include "..\FirstCAV\functions.hpp"
}

#include "ui\firstcav.hpp"

// load profile namespace variables for runtime use
__EXEC(allProfileNamespaceVars = allVariables profileNamespace);