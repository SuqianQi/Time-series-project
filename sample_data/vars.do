use "C:\stata\TS\Paper\Time-series-project\raw_data\sample_data.dta"

destring s, replace ignore(",")
drop if missing(gasp) // 1991m1-2024m2
tsset date, m 

gen log_y = log(y)
gen dlny = L1.log_y
gen test = 0
replace test = 1 if date > ym(2022,2) // create the test set
//twoway line dlny date
foreach var of varlist dlny u gasp ffd s vix_un ovx_un news_un gdpmodel_un sales_un gdpdisp_un{
	quietly reg `var' date
	predict `var'_t, resid
	tssmooth ma `var'_trend = `var'_t, window(6 1 5)  
	gen `var'_adj = `var'_t - `var'_trend  
} // detrend and deseasonalized all the variables to make them stationary
//twoway line dlny_adj date

//keep if test == 1

matrix A1 = (1,0,0,0 \ .,1,0,0 \ .,.,1,0 \ .,.,.,1)
matrix B1 = (.,0,0,0 \ 0,.,0,0 \ 0,0,.,0 \ 0,0,0,.)

foreach i of varlist dlny_adj u_adj gasp_adj {
    local allgraphs ""
    
    foreach j of varlist vix_un_adj ovx_un_adj news_un_adj gdpmodel_un_adj sales_un_adj gdpdisp_un_adj {
        svar `i' ffd_adj s_adj `j', lags(1/3) aeq(A1) beq(B1)
        irf create varirf, step(24) set(var, replace)
        irf graph sirf, impulse(`j') response(`i') ///
			ciopts(color(ltblue*.3)) byopts(note("") legend(off)) ///
            title("`j'") ///
            ytitle("`i', % deviation from trend") xtitle("Months after shock") ///
			name(`j'_on_`i', replace)
        local allgraphs `allgraphs' `j'_on_`i'
    }
    graph combine `allgraphs', name(irf_`i', replace) ///
		title("`i' Responses to Uncertainty")
    graph export "irf_`i'.png", as(png) replace
}

use "C:\stata\TS\Paper\Time-series-project\raw_data\test.dta",clear
gen month = _n-1
twoway line dlny_adj month,name(dlny, replace) ///
	title("Log Industrial Production Grwoth Rate") /// 
	xtitle("Months after shock") ///
	xscale(range(0 30))
twoway line u_adj month,name(u, replace) ///
	title("Unemployment Rate") ///
	xtitle("Months after shock") ///
	xscale(range(0 30))
twoway line gasp_adj month,name(p, replace) ///
	title("Gas Price Index") ///
	xtitle("Months after shock") ///
	xscale(range(0 30))
graph combine dlny u p ///
	dlny_adj_on_vix_un_adj u_adj_on_vix_un_adj gasp_adj_on_ovx_un_adj ///
	dlny_adj_on_gdpmodel_un_adj u_adj_on_gdpmodel_un_adj gasp_adj_on_gdpmodel_un_adj

