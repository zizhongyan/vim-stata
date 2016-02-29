" syntax/stata.vim -- Vim syntax file for Stata source files
" This is a modification version to the Stata/Mata syntax highlighting file by Jeff 
" Pitblado (2015) <jpitblado at stata.com> which could highlight about 173 Stata
" commands and 296 Stata functions.
"The file could highlight
    " 1. most of the Stata in-built commands (keep updated),
    " 2. some popular user-written commands, 
    " 3. abbreviation of commands, 
    " 4. numbers,
    " 5. logical and mathematic operators. 
    " 6. enable different colours for commands used for different purpose.
" This syntax highlighting file is also compatible with Stata 14.
" Modified by Zizhong Yan (helloyzz@gmail.com) --- 22 December 2015.
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syntax case match

" comments - single line
" note that the triple slash continuing line comment comes free
syn region stataStarComment  start=/^\s*\*/ end=/$/ contains=stataComment oneline
syn region stataSlashComment start="\s//"   end=/$/ contains=stataComment oneline
syn region stataSlashComment start="\s///"  end=/$/ contains=stataComment oneline
syn region stataSlashComment start="^//"    end=/$/ contains=stataComment oneline

" comments - multiple line
syn region stataComment start="/\*" end="\*/" contains=stataComment

" Macros - simple case
syn match  stataGlobal /\$\a\w*/ 
syn region stataGlobal start=/\${/ end=/}/ oneline contains=@stataMacroGroup 
syn region stataLocal  start=/`/ end=/'/   oneline contains=@stataMacroGroup

" numeric formats
syn match  stataFormat /%-\=\d\+\.\d\+[efg]c\=/
" numeric hex format
syn match  stataFormat /%-\=21x/
" string format
syn match  stataFormat /%\(\|-\|\~\)\d\+s/

" Statements
syn keyword stataCommanddata      use clear preserve restore joinby
syn keyword stataCommanddata      merge
syn keyword stataCommanddata      append   
syn keyword stataCommanddata      reshape
syn keyword stataCommanddata      erase
syn keyword stataCommanddata      import
syn keyword stataCommanddata      keep
syn keyword stataCommanddata      drop 
syn keyword stataCommanddata      sa
syn keyword stataCommanddata      sav
syn keyword stataCommanddata      save
syn keyword stataCommanddata      saveold
syn keyword stataCommanddata      use13
syn keyword stataCommanddata      use14
syn keyword stataCommanddata      do
syn keyword stataCommanddata      exit
syn keyword stataCommanddata      shell
syn keyword stataCommanddata      ado of
syn keyword stataCommanddata      saving
syn keyword stataCommandloop      foreach of
syn keyword stataCommandloop      forv[alues]
syn keyword stataCommandloop      while
syn keyword stataCommandloop      pr[ogram]
syn keyword stataCommandloop      en[d]
syn keyword stataCommandloop      else if
" Common programming commands
syn keyword stataCommandbig ac ac_7 acprplot acprplot_7 avplot avplot_7 avplots avplots_7 adjust alpha ameans anova_estat aorder arch arch_dr arch_estat arch_p archlm areg arima arima_estat asmprobit
syn keyword stataCommandbig bar bgodfrey biprobit bitest bitesti bitowt blogit bmemsize boot bootsamp bootstrap bootstrap_8 boxcox bprobit brier brr brrstat bs bsample
syn keyword stataCommandbig connect ca cci censobs_table centile cf checkdlgfiles checkestimationsample checkhlpfiles ci cii classutil clo clog clog_lf clog_p clogi clogi_sw clogit clogit_lf  
syn keyword stataCommandbig cluster cnreg cnreg_p cnreg_sw cnsreg codebook collaps4 collapse compare conren contract copysource corc corr2data corr_anti corr_kmo corr_smc corrgram crc cross cumsp cumsp_7 cumul cusum
syn keyword stataCommandbig destring dfbeta dfgls dfuller dirstats disp_res disp_s dotplot dotplot_7 dprobit drawnorm ds ds_util dstdize duplicates durbina dwstat dydx 
syn keyword stataCommandbig egen eivreg emdef eq ereg ereg_lf ren rena renam rename replace  ereg_p ereg_sw ereghet ereghet_glf ereghet_glf_sh ereghet_gp ereghet_ilf ereghet_ilf_sh 
syn keyword stataCommandbig ereghet_ip est est_cfexist est_cfname est_clickable est_expand est_hold est_table est_unhold est_unholdok  estat estat_default estat_summ estat_vce_only esti estimates etodow etof etomdy expandcl 
syn keyword stataCommandbig so sor sort  set
syn keyword stataCommandbig fac fact facto factor factor_estat factor_p factor_pca_rotated factor_rotate factormat fcast fcast_compute fcast_graph fh_st fillin find_hlp_file findfile findit fit frontier ftodate ftoe ftomdy ftowdate 
syn keyword stataCommandbig hadimvo hareg hausman he heck_d2 heckma_p heckman heckp_lf heckpr_p heckprob hel help hereg hetprob hettest hilite hist histogram hlogit hmeans hotel hotelling hprobit hreg hsearch 
syn keyword stataCommandbig impute imtest inbase integ inten intreg ipolate iqreg ir irf irf_create irfm iri isid istdize ivprobit ivreg ivreg2 ivregeress ivtobit ivtobit_p jackknife jacknife jknife jkstat joinby 
syn keyword stataCommandbig kalarma1 kap kapmeier kappa kapwgt kdensity kdensity_7 ksm ksmirnov ktau kwallis 
syn keyword stataCommandbig labelbook ladder levels levelsof leverage lfit lfit_p lincom line linktest logi logistic logit logit_estat logit_p loglogs logrank loneway lookfor lowess lowess_7 lpredict lrecomp lroc lrtest lsens lsens_x lstat ltable ltriang lv lvr2plot lvr2plot_7 
syn keyword stataCommandbig makecns manova_estat manova_p mantel matlist matname mdsmat mdsshepard mdytoe mdytof me_derd mean means median memsize meqparse mfp mfx mhelp mhodds minbound mixed_ll mixed_ll_reparm mkassert mkmat mkspline ml _cycle ml_elf_dfp ml_elfi ml_elfs ml_enr0i ml_enrr0 ml_erdu0 ml_erdu0_bfgs ml_erdu0_bhhh ml_erdu0_bhhhq ml_erdu0_cycle ml_erdu0_dfp ml_erdu0_nrbfgs ml_exde ml_footnote ml_geqnr ml_grad0 ml_graph ml_hbhhh ml_hd0 ml_hold ml_init ml_inv ml_log ml_max ml_mlout ml_mlout_8 ml_model ml_nb0 ml_opt ml_p ml_plot ml_query ml_rdgrd ml_repor ml_s_e ml_score ml_searc ml_technique ml_unhold mlf_ mlog mlogi mlogit mlogit_footnote mlogit_p mlopts mnl0_ mprobit mprobit_lf mprobit_p mrdu0_ mrdu1_ mvdecode mvencode mvreg mvreg_estat nbreg nbreg_al nbreg_lf nbreg_p nbreg_sw nestreg newey newey_7 newey_p nl nl_7 nl_9 nl_9_p nl_p nl_p_7 nlcom nlcom_p nlexp2 nlexp2_7 nlexp2a nlexp2a_7 nlexp3 nlexp3_7 nlgom3 nlgom3_7 nlgom4 nlgom4_7 nlinit nllog3 nllog3_7 nllog4 nllog4_7 nlog_rd nlogit nlogit_p nlogitgen nlogittree nlpred note notes nptrend numlabel
syn keyword stataCommandbig olog ologi ologit ologit_p ologitp op_colnm op_comp op_diff opr opro oprob oprob_sw oprobi oprobi_p oprobit oprobitp opts_exclusive orthog orthpoly ovtest pac pac_7 palette parse_dissim pause pca pca_8 pca_display pca_estat pca_p pca_rotate pcamat pchart pchart_7 pchi pchi_7 pcorr pctile pentium pergram pergram_7 permute permute_8 personal peto_st pkcollapse pkcross pkequiv pkexamine pkexamine_7 pkshape pksumm pksumm_7 pnorm pnorm_7 poisgof poiss_lf poiss_sw poisso_p poisson poisson_estat pperron prais prais_e prais_e2 prais_p predict predictnl print prob probi probit probit_estat probit_p proc_time procoverlay procrustes procrustes_estat procrustes_p profiler prop proportion prtest prtesti pwcorr qby qbys qchi qchi_7 qladder qladder_7 qnorm qnorm_7 qqplot qqplot_7 qreg qreg_c qreg_p qreg_sw quadchk quantile quantile_7 range ranksum ratio rchart rchart_7 rcof recast recode reg reg3 reg3_p regdw regr regres regress regress_estat regriv_p remap renpfix repeat roccomp_7 roccomp_8 rocf_lf rocfit rocfit_8 rocgold rocplot rocplot_7 roctab roctab_7 rolling rologit rologit_p rot rota rotat rotate rotatemat rreg rreg_p runtest rvfplot rvfplot_7 rvpplot rvpplot_7 safesum sample sampsi  sc scatter scm_mine sco scob_lf scob_p scobi_sw scobit scor score scoreplot scoreplot_help scree screeplot screeplot_help sdtest sdtesti separate seperate serrbar serrbar_7 set_defaults sfrancia shewhart shewhart_7 signestimationsample signrank signtest simul simul_7 simulate simulate_8 sktest slogit slogit_d2 slogit_p smooth snapspan spearman spikeplot spikeplot_7 spikeplt spline_x split sqreg sqreg_p ssc st st_ct st_hc st_hcd st_hcd_sh st_is st_issys st_note st_promo st_set st_show st_smpl st_subid stack statsby statsby_8 stbase stci stci_7 stcox stcox_estat stcox_fr stcox_fr_ll stcox_p stcox_sw stcoxkm stcoxkm_7 stcstat stcurv stcurve stcurve_7 stdes stem stepwise stereg stfill stgen stir stjoin stmc stmh stphplot stphplot_7 stphtest stphtest_7 stptime strate strate_7 streg streg_sw streset sts sts_7 stset stsplit stsum sttocc sttoct stvary stweib suest suest_8 sunflower sureg survcurv survsum svar svar_p svmat svy svy_disp svy_dreg svy_est svy_est_7 svy_estat svy_get svy_gnbreg_p svy_head svy_header svy_heckman_p svy_heckprob_p svy_intreg_p svy_ivreg_p svy_logistic_p svy_logit_p svy_mlogit_p svy_nbreg_p svy_ologit_p svy_oprobit_p svy_poisson_p svy_probit_p svy_regress_p svy_sub svy_sub_7 svy_x svy_x_7 svy_x_p svydes svydes_8 svygen svygnbreg svyheckman svyheckprob svyintreg svyintreg_7 svyintrg svyivreg svylc svylog_p svylogit svymarkout svymarkout_8 svymean svymlog svymlogit svynbreg svyolog svyologit svyoprob svyoprobit svyopts svypois svypois_7 svypoisson svyprobit svyprobt svyprop svyprop_7 svyratio svyreg svyreg_p svyregress svyset svyset_7 svyset_8 svytab svytab_7 svytest svytotal sw sw_8 swcnreg swcox swereg swilk swlogis swlogit swologit swoprbt swpois swprobit swqreg swtobit swweib symmetry symmi symplot symplot_7 sysdescribe sysuse szroeter tab1 tab2 tab_or tabi table tabodds tabodds_7 tabstat te tes test testnl testparm teststd tetrachoric time_it tis tob tobi tobit tobit_p tobit_sw tostring total treat_ll treatr_p treatreg trim trnb_cons trnb_mean trpoiss_d2 trunc_ll truncr_p truncreg tsappend tset tsfill tsline tsline_ex tsreport tsrline tsset tssmooth tsunab ttest ttesti tut_chk tut_wait tutorial tw tware_st two twoway twoway__fpfit_serset twoway__function_gen twoway__histogram_gen twoway__ipoint_serset twoway__ipoints_serset twoway__kdensity_gen twoway__lfit_serset twoway__normgen_gen twoway__pci_serset twoway__qfit_serset twoway__scatteri_serset twoway__sunflower_gen twoway_ksm_serset typeof unab unabbrev uselabel var var_mkcompanion var_p varbasic varfcast vargranger varirf varirf_add varirf_cgraph varirf_create varirf_ctable varirf_describe varirf_dir varirf_drop varirf_erase varirf_graph varirf_ograph varirf_rename varirf_set varirf_table varlmar varnorm varsoc varstable varstable_w varstable_w2 varwle vce vec vec_fevd vec_mkphi vec_p vec_p_w vecirf_create veclmar veclmar_w vecnorm vecnorm_w vecrank vecstable verinst viewsource vif vwls wdatetof webdescribe webseek webuse weib1_lf weib2_lf weib_lf weib_lf0 weibhet_glf weibhet_glf_sh weibhet_glfa weibhet_glfa_sh weibhet_gp weibhet_ilf weibhet_ilf_sh weibhet_ilfa weibhet_ilfa_sh weibhet_ip weibu_sw weibul_p weibull weibull_c weibull_s weibullhet whelp wilc_st wilcoxon wntestb wntestb_7 wntestq 
syn keyword stataCommandbig xchart xcorr xpose xt_iis xt_tis xtabond xtclog xtcloglog xtcorr xtdata xtdes xtfront_p xtfrontier xtgee xtgee_elink xtgee_estat xtgee_makeivar xtgee_p xtgee_plink xtgls xtgls_p xthaus xthausman xtht_p xthtaylor xtile xtint_p xtintreg xtintreg_8 xtintreg_d2 xtintreg_p xtivp_1 xtivp_2 xtivreg xtline xtline_ex xtlogit xtlogit_8 xtlogit_d2 xtlogit_fe_p xtlogit_pa_p xtlogit_re_p xtmixed xtmixed_estat xtmixed_p xtnb_fe xtnb_lf xtnbreg xtnbreg_pa_p xtnbreg_refe_p xtpcse xtpcse_p xtpois xtpoisson xtpoisson_d2 xtpoisson_pa_p xtpoisson_refe_p xtpred xtprobit xtprobit_8 xtprobit_d2 xtprobit_re_p xtps_fe xtps_lf xtps_ren xtps_ren_8 xtrar_p xtrc xtrc_p xtrchh xtrefe_p xtreg xtreg_be xtreg_fe xtreg_ml xtreg_pa_p xtreg_re xtregar xtrere_p xtset xtsf_ll xtsf_llti xtsum xttab xttest0 xttobit xttobit_p xttrans
syn keyword stataCommandbig g ge gen gene gener genera generat generate 
syn keyword stataCommandbig rcap
" Small command
syn keyword stataCommandsmall about an title ano xi xsize anov anova r legend ysize anovadef name 
syn keyword stataCommandsmall export size ap pweight pw symxsize grid valuelabel ytitle fcolor lcolor ifcolor color variable xtitle ylabel xlabel labsize angle glcolor glwidth lpattern mcolor msymbol msize margin glpattern  symysize cols ring 
syn keyword stataCommandsmall graphregion position define fw scheme delimited varlist values fweight iw iweight 
syn keyword stataCommandsmall cap args assert br break bro brow brows browse matsize
syn keyword stataCommandsmall by bys byso bysor bysort capt captu captur capture cat cd char chdir checksum chelp cl class cli clis clist cmdlog compress conf confi confir confirm cons const constr constra constrai constrain constraint 
syn keyword stataCommandsmall continue copy cor corr corre correl correla correlat correlate cou coun count cox cret cretu cretur creturn datasig 
syn keyword stataCommandsmall datasign datasigna datasignat datasignatu datasignatur datasignature dec deco decod decode di di_g dir dis discard disp displ displa display
syn keyword stataCommandsmall e ed edi edit else en enc enco encod encode erase eret eretu eretur ereturn err erro error 
syn keyword stataCommandsmall expand fdades fdadesc fdadescr fdadescri fdadescrib fdadescribe fdasav fdasave fdause file filefilter 
syn keyword stataCommandsmall fl fli flis flist  form forma format gettoken gl glo glob globa global gprefs gr7 graph7 haver hexdump if in include inf infi infil infile infix inp inpu input ins insheet insp inspe inspec inspect l la lab labe label li lis list loc loca local log lookup ls m ma mac macr macro man manova manovatest mark markin markout marksample mat mat_put_rr mata mata_clear mata_describe mata_drop mata_memory mata_mlib mata_mosave mata_rename mata_which matr matri matrix memory mkdir mleval mlmatbysum mlmatsum des desc descr descri describ describe  mlsum mlvecsum mor more mov move n net news no nobreak noi nois noisi noisil noisily notes_dlg numlist odbc on one onew onewa oneway order ou out outf outfi outfil outfile outs outsh outshe outshee outsheet parse pl plo plot plugin post postclose postfile postutil   pwd q qu que quer query qui quie quiet quietl quietly  ret retu retur return rmdir ru run  sca scal scala scalar se search serset  sh she shel shell sleep sret sretu sretur sreturn syntax sysdir  tabd tabdi tabdis tabdisp 
syn keyword stataCommandsmall sheet firstrow su sum summ summa summar summari summariz summarize ta tab tabu tabul tabula tabulat tabulate  tempfile tempname tempvar timer 
syn keyword stataCommandsmall token tokeni tokeniz tokenize translate translator transmap tsrevar ty typ type u unabcmd update vers versi versio version view 
syn keyword stataCommandsmall wh whi which whil while win wind windo window winexec xmlsav xmlsave xmluse xsh xshe xshel xshell estadd eststo estout use13 pscore attr attk attx
" Literals
syn match  stataQuote   /"/
syn region stataEString matchgroup=Nothing start=/`"/ end=/"'/ oneline contains=@stataMacroGroup,stataQuote,stataString,stataEString
syn region stataString  matchgroup=Nothing start=/"/ end=/"/   oneline contains=@stataMacroGroup
" define clusters
syn cluster stataFuncGroup  contains=@stataMacroGroup,stataFunc,stataString,stataEstring,stataParen,stataBracket,stataStarComment,stataSlashComment,stataComment
syn cluster stataMacroGroup contains=stataGlobal,stataLocal
syn cluster stataParenGroup contains=stataParenError,stataBracketError,stataBraceError,stataSpecial,stataFormat
" Stata functions
" Math
syn region stataFunc matchgroup=Function start=/\<abs(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<acos(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<acosh(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<asin(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<asinh(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<atan(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<atan2(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<atanh(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<ceil(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<cloglog(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<comb(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<cos(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<cosh(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<digamma(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<exp(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<floor(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<int(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<invcloglog(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<invlogit(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<ln(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<lnfactorial(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<lngamma(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<log(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<log10(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<logit(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<max(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<min(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<mod(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<reldif(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<round(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<sign(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<sin(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<sinh(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<sqrt(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<sum(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<tan(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<tanh(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<trigamma(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<trunc(/ end=/)/ contains=@stataFuncGroup 
syn region stataFunc matchgroup=Function start=/\<ibeta(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<betaden(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<ibetatail(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<invibeta(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<invibetatail(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<nibeta(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<nbetaden(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<invnibeta(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<binomial(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<binomialp(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<binomialtail(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<invbinomial(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<invbinomialtail(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<chi2(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<chi2den(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<chi2tail(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<invchi2(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<invchi2tail(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<nchi2(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<nchi2den(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<nchi2tail(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<invnchi2(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<invnchi2tail(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<npnchi2(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<dunnettprob(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<invdunnettprob(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<F(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<Fden(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<Ftail(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<invF(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<invFtail(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<nF(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<nFden(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<nFtail(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<invnFtail(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<npnF(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<gammap(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<gammaden(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<gammaptail(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<invgammap(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<invgammaptail(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<dgammapda(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<dgammapdada(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<dgammapdadx(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<dgammapdx(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<dgammapdxdx(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<hypergeometric(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<hypergeometricp(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<nbinomial(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<nbinomialp(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<nbinomialtail(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<invnbinomial(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<invnbinomialtail(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<binormal(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<normal(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<normalden(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<invnormal(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<lnnormal(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<lnnormalden(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<poisson(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<poissonp(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<poissontail(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<invpoisson(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<invpoissontail(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<t(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<tden(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<ttail(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<invt(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<invttail(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<nt(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<ntden(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<nttail(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<invnttail(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<npnt(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<tukeyprob(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<invtukeyprob(/ end=/)/ contains=@stataFuncGroup 
syn region stataFunc matchgroup=Function start=/\<runiform(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<rbeta(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<rbinomial(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<rchi2(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<rgamma(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<rhypergeometric(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<rnbinomial(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<rnormal(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<rpoisson(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<rt(/ end=/)/ contains=@stataFuncGroup 
syn region stataFunc matchgroup=Function start=/\<abbrev(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<char(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<indexnot(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<itrim(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<length(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<lower(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<ltrim(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<plural(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<proper(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<real(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<regexm(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<regexr(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<regexs(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<reverse(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<rtrim(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<soundex(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<soundex_nara(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<strcat(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<strdup(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<string(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<strlen(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<strlower(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<strltrim(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<strmatch(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<strofreal(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<strpos(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<strproper(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<strreverse(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<strrtrim(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<strtoname(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<strtrim(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<strupper(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<subinstr(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<subinword(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<substr(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<trim(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<upper(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<word(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<wordcount(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<rowmiss(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<rowmean(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<rowmax(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<rowmin(/ end=/)/ contains=@stataFuncGroup  
syn region stataFunc matchgroup=Function start=/\<autocode(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<byteorder(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<c(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<_caller(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<chop(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<clip(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<cond(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<e(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<epsdouble(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<epsfloat(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<fileexists(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<fileread(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<filereaderror(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<filewrite(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<float(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<fmtwidth(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<has_eprop(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<inlist(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<inrange(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<irecode(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<matrix(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<maxbyte(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<maxdouble(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<maxfloat(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<maxint(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<maxlong(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<mi(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<minbyte(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<mindouble(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<minfloat(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<minint(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<minlong(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<missing(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<r(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<recode(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<replay(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<return(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<s(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<scalar(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<smallestdouble(/ end=/)/ contains=@stataFuncGroup 
syn region stataFunc matchgroup=Function start=/\<bofd(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<Cdhms(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<Chms(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<Clock(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<clock(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<Cmdyhms(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<Cofc(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<cofC(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<Cofd(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<cofd(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<daily(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<date(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<day(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<dhms(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<dofb(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<dofC(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<dofc(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<dofh(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<dofm(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<dofq(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<dofw(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<dofy(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<dow(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<doy(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<halfyear(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<halfyearly(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<hh(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<hhC(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<hms(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<hofd(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<hours(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<mdy(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<mdyhms(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<minutes(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<mm(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<mmC(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<mofd(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<month(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<monthly(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<msofhours(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<msofminutes(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<msofseconds(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<qofd(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<quarter(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<quarterly(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<seconds(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<ss(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<ssC(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<tC(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<tc(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<td(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<th(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<tm(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<tq(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<tw(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<week(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<weekly(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<wofd(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<year(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<yearly(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<yh(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<ym(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<yofd(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<yq(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<yw(/ end=/)/ contains=@stataFuncGroup 
syn region stataFunc matchgroup=Function start=/\<tin(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<twithin(/ end=/)/ contains=@stataFuncGroup 
syn region stataFunc matchgroup=Function start=/\<colnumb(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<colsof(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<det(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<diag0cnt(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<el(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<issymmetric(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<matmissing(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<mreldif(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<rownumb(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<rowsof(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<trace(/ end=/)/ contains=@stataFuncGroup 
syn region stataFunc matchgroup=Function start=/\<cholesky(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<corr(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<diag(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<get(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<hadamard(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<I(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<inv(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<invsym(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<J(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<matuniform(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<nullmat(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<sweep(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<vec(/ end=/)/ contains=@stataFuncGroup
syn region stataFunc matchgroup=Function start=/\<vecdiag(/ end=/)/ contains=@stataFuncGroup
" Errors to catch
" taken from $VIMRUNTIME/syntax/c.vim 
" catch errors caused by wrong parenthesis, braces and brackets
syn region  stataParen  transparent start=/(/ end=/)/  contains=ALLBUT,@stataParenGroup,stataErrInBracket,stataErrInBrace
syn region  stataBracket  transparent start=/\[/ end=/]/ contains=ALLBUT,@stataParenGroup,stataErrInParen,stataErrInBrace
syn region  stataBrace  transparent start=/{/ end=/}/  contains=ALLBUT,@stataParenGroup,stataErrInParen,stataErrInBracket
syn match stataParenError /[\])}]/
syn match stataBracketError /]/
syn match stataBraceError /}/
syn match stataErrInParen contained /[\]}]/
syn match stataErrInBracket contained /[)}]/
syn match stataErrInBrace contained /[)\]]/
" Highlighting Operators
syntax match stataOperator "\$"   
syntax match stataOperator "\!"   
syntax match stataOperator "\v\+"
syntax match stataOperator "\v\|"
syntax match stataOperator "\v\&"
syntax match stataOperator "\v-"
syntax match stataOperator "\v\?" 
syntax match stataOperator "\v\+\="
syntax match stataOperator "\v-\="
syntax match stataOperator "\v\="
syntax match stataOperator "\v\>"
syntax match stataOperator "\v\<"
" Highlighting numbers    
syn match   statasHexNumber "\<0[xX]\x\+[lL]\=\>" display
syn match   statasOctNumber "\<0[oO]\o\+[lL]\=\>" display
syn match   statasBinNumber "\<0[bB][01]\+[lL]\=\>" display
syn match   statasHexNumber "\<0[xX]\x\+\>" display
syn match   statasOctNumber "\<0[oO]\o\+\>" display
syn match   statasBinNumber "\<0[bB][01]\+\>" display
syn match   statasNumber  "\<\d\>" display
syn match   statasNumber  "\<[1-9]\d\+\>" display
syn match   statasNumber  "\<\d\+[jJ]\>" display
syn match   statasFloat   "\.\d\+\%([eE][+-]\=\d\+\)\=[jJ]\=\>" display
syn match   statasFloat   "\<\d\+[eE][+-]\=\d\+[jJ]\=\>" display
syn match   statasFloat   "\<\d\+\.\d*\%([eE][+-]\=\d\+\)\=[jJ]\=" display
hi def link statasNumber           Number
hi def link statasHexNumber        Number
hi def link statasOctNumber        Number
hi def link statasBinNumber        Number
hi def link statasFloat            Float 
" assign highlight groups
hi def link stataBraceError stataError
hi def link stataBracketError stataError
hi def link stataErrInBrace stataError
hi def link stataErrInBracket stataError
hi def link stataErrInParen stataError
hi def link stataEString  stataString
hi def link stataFormat   stataSpecial 
hi def link stataParenError stataError
hi def link stataSlashComment stataComment
hi def link stataStarComment  stataComment

hi def link stataComment  Comment
hi def link stataCommandloop  Question
hi def link stataCommanddata  Title
hi def link stataCommandbig   Statement
hi def link stataCommandsmall Define
hi def link stataOperator Operator  
hi def link stataError    Error
hi def link stataFunc   SpecialKey
hi def link stataGlobal   Macro 
hi def link stataLocal    Macro 
hi def link stataRepeat   Repeat
hi def link stataSpecial  SpecialChar
hi def link stataString   String

let b:current_syntax = "stata"

" vim: ts=8
" end: syntax/stata.vim
