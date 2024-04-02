local ls = require "luasnip"
local s = ls.snippet

-- format formats a string and a list a nodes
-- fmt(<fmt_string>, {...nodes})
local fmt = require("luasnip.extras.fmt").fmt

-- insert node
-- takes a position (like $1) and optionally some default text
-- i(<position>, [default_text])
local i = ls.insert_node

-- Repeats a node
-- rep(<positon>)
local rep = require("luasnip.extras").rep


-- Keep snippets below
-- ls.add_snippets(filetype, snippets)
ls.add_snippets("all", {
  ls.parser.parse_snippet("expand", "-- this is what was expanded!"),
})

-- tutorial lua snippets - remember $0 is last visited
ls.add_snippets("lua", {
  ls.parser.parse_snippet("lf", "-- Defined in $TM_FILENAME\nlocal $1 = function($2)\n  $0\nend"),
  ls.parser.parse_snippet("mf", "$1.$2 = function($3)\n  $0\nend"),
  s("req_s",fmt("local {} = require('{}')", { i(1, "default"), rep(1) })),
  })

ls.add_snippets("python",{
  ls.parser.parse_snippet("plt","fig, ax = plt.subplots() \nax.plot($1,$2, linewidth=2.0) \nax.set_xlabel($3) \nax.set_ylabel($4) \nax.set_title($0) \nplt.show()"),
  ls.parser.parse_snippet("np_norm","x = np.random.normal(3, 2.5, size=(2, 4)) \ny = np.random.normal(3, 2.5, size=(2, 4)"),
  ls.parser.parse_snippet("exp_corr", "corr_fig = plt.figure() \ncorr_matrix = $1.corr() \ncorr_map = sns.heatmap(corr_matrix, annot = True)"),
  ls.parser.parse_snippet("exp_pair", "g = sns.PairGrid($1, corner=True) \ng.map_diag(sns.histplot) \ng.map_offdiag(sns.scotterplot)"),
  ls.parser.parse_snippet("OLS", "x_train, x_test , y_train, y_test = train_test_split($1 \n,$2 \n,test_size=0.20 \n,random_state=1) \n\nscaler = StandardScaler() \nx_train = scaler.fit_transform(x_train) \nx_test = scaler.transform(x_test) \n\nlinear_model = LinearRegression() \nlinear_model.fit(x_train,y_train)"),
  -- ls.parser.parse_snippet("evaluate","Code here"),
  })
