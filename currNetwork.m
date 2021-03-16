function [Y,Xf,Af] = currNetwork(X,~,~)
%CURRNETWORK neural network simulation function.
%
% Auto-generated by MATLAB, 25-Feb-2021 22:45:28.
% 
% [Y] = currNetwork(X,~,~) takes these arguments:
% 
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = 13xQ matrix, input #1 at timestep ts.
% 
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = 2xQ matrix, output #1 at timestep ts.
% 
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [1;1.9;7;2;0;12;4;5;18;2;15;16;75];
x1_step1.gain = [0.166666666666667;0.0711743772241993;0.153846153846154;0.25;0.166666666666667;0.0196078431372549;0.0740740740740741;0.0210526315789474;0.00518134715025907;0.00611620795107034;0.0465116279069767;0.0238095238095238;0.0170940170940171];
x1_step1.ymin = -1;

% Layer 1
b1 = [-1.7614942730675282601;-1.4815822762557921966;-1.3259930786770772748;0.92921604044909378306;-0.42928508439747120606;-0.013847970383452467072;0.10687998621560844403;0.33868425965639642472;0.62601268037905644093;-1.0313008499221567593;0.94678481506155343084;-1.4845536135653805143;1.7251932349423342306];
IW1_1 = [0.59329503556293461397 0.08776951625878327834 0.70998886316809695085 -0.61177126536999271167 -0.42168939662417487257 -0.085385895066485875682 0.65923554273928408609 -0.59237018365357729799 -0.69425701374265091914 -0.27018854862077218426 0.44452734052827702627 0.64772377930023206094 0.32540518478245394896;0.51752699958695302929 0.59057720853653628001 0.35130606005318448792 0.6385805061901069779 -0.016963780711275973367 0.21244174164952381312 -0.72684328821902377538 0.68796612127666068037 -0.31339505655153149233 -0.42227958178528574029 0.48819245248640047441 -0.478737701188025222 0.11599135022507668646;0.40773834504475608975 0.097629209236433672769 -0.11318710078848404077 -0.29322450613401007669 -0.1141483808911852027 -0.53067378281192223444 0.41696044974278689832 -0.58100261695169386211 -0.5490203510553046673 -0.512885479872593808 0.18541952456139584871 0.48464226102326446455 -0.83349466164839114413;-0.68611945179004940609 0.59600700939789763577 -0.50008855713519129171 0.2091885751603767829 -0.67552997689148486238 -0.24043703565189764038 -0.43099663330067794487 0.030869637159374328089 0.050301004900384686802 0.4953493897694757897 0.41391855799765631119 0.69120102460505306041 0.2177764333206415881;0.96474432944559673775 0.76980006522160993043 -0.13574243799729579507 -0.14748031829225638489 0.33705995095292318187 0.037840896063020879048 -0.5216613245158755463 0.2598189095432498763 -0.0046392129992904413902 -0.7765207297388283525 -0.56066273270640876181 -0.020321096674258444514 0.52472473824649323859;-0.32701042719932976732 -0.25155761351645816726 0.15144863037389616478 -0.30290760395540977656 -0.57747998402366274018 -0.13134043199737338581 0.46667546338640469861 -0.58235017544637890374 -0.92695713216080666275 -0.38501627944894833977 0.061844066690623186733 -0.98702322366355377259 -0.57927510770037538013;1.0989166433217996133 0.59956713093349500721 0.55431580295109328382 -0.38629340859307564893 0.18493541505784089063 0.040689255395984072483 -0.55286877145609658601 -0.30881339894196663254 -0.5103051190402890791 0.19988477485703040615 -0.50661054104392655439 -0.031681136947055557607 -0.74562173455488256479;0.59680741852051222285 0.81744041267836009546 0.0023517555490379384552 5.9692132543143639617e-05 -0.66373489465753621186 -0.79129383609262449184 -0.080535845516429921398 0.065100092742616119668 -0.60930361389370579772 0.38748954835220295045 0.015678838027741587302 0.90606020169098300254 0.038019377510828171463;0.71080961093058847577 -0.5340301093566186541 0.65521180481651275507 -0.006153027393181889973 0.38872283660512851888 0.20532813663809224014 -0.43341061605289976644 0.87763515572599071213 -0.56941713168439145321 0.085047820392300937931 -0.56026975109105225936 0.3179104853821542731 0.41624258942954533991;-0.32181432738855186848 -0.092893032937278921524 -0.023586260804131627122 -0.70121131853145568513 0.51865288754540350702 -0.26704129330254083863 0.28434871104007536369 0.85621975265279826051 -0.14468722960516067211 0.25629472834180455632 0.32700994800727678502 -0.79905024754733844361 -0.61442783199025019503;0.53717576809324452114 0.55037737279722098727 -0.64588182407036842658 0.71476021568806102913 0.74311319944530929149 -0.14339557502985456061 0.03789838301507468532 0.2214832518988157084 0.0062236639804208633564 -0.42954960229639738145 0.37817351955555134069 -0.66748337608510188712 -0.55554884213638511259;-0.62261735227376424628 -0.024291653568959355181 -0.15857652019006190924 -0.24846327253030406346 -0.72439878460900186674 -0.027617344137709436136 -0.88107342193498816574 0.76159816359849985545 0.26065282312827775524 0.073225007998614408122 0.12836353770446867761 -0.5420850837517405818 -0.38837954566195870276;0.38783318846287745396 -0.13277785562106911299 -0.27533601060887558098 0.34562531887253056251 0.25293278444238898039 0.1971129867740243069 -0.55128095575829438868 -0.57657417653912124145 0.19052124479826040848 -1.00549362864158498 -0.34267540790131578721 -0.25783923344579212644 -0.71861521640010717071];

% Layer 2
b2 = [-1.7927362034705638383;1.6545796204184022304;1.547249103231368661;-1.3779552296054002891;1.2267539229379116339;1.041117848578761329;0.95226983520148766882;-0.77901124141127187084;-0.61134776281698877121;0.45656644385920375218;0.25949501158301913062;-0.13223143654755525889;-0.18175099497983407404;0.093052449747410004299;-0.19926972718966529108;-0.37069741785770071729;0.44877961274583327844;0.67300788308785841618;-0.65657848862759760067;0.95832621461525502315;-1.1121485026799069473;1.2483493710511661678;1.3271363180628554801;1.4393711117623348983;1.7226821821388040856;1.8272877354867933519];
LW2_1 = [0.59180756991138383505 0.68989807414563819599 0.75431406806551404287 0.2528285748293101487 -0.32069170054211043608 0.71679260588798610065 -0.20860227279143017665 -0.42764274809163982383 -0.58959078179340607129 0.74214289674182998269 -0.062634457309146657211 -0.028906086070794093784 -0.17520348870901719662;-0.29961618729193106869 -0.18513738729403750316 -0.11378193388654239682 0.79484323334013828877 -0.39626037156660093297 0.27049945950989440213 -0.69024473934655794505 0.23149327653484780276 0.11050911300370780399 -0.56147788057387459926 0.62131832699012101706 0.3007691172365103971 -0.9666337987377098262;-0.14612052084093749005 -0.34590801966460382744 -0.74462558156770575213 0.11394175042496552941 -0.17746401551817123088 -0.59837703731420943676 0.68597331317602294742 0.44604783424645866319 0.58649783872413796537 -0.2943528672819962777 -0.2312076481348764867 -0.58073795213508083712 -0.77752313170497100447;0.65167248224132523493 0.12552201308475002817 0.21056391883900993367 0.21629339166100716718 -0.62343226481097657743 0.51332896095973201689 -0.10269932849799316699 -0.77267724633373147114 -0.6624925134428425455 -0.17444679224336234746 0.71723500046485766379 -0.45326398406588880308 0.42110785555843338601;-0.28745229347578776791 -0.45438656815634359543 -0.79335225785045315749 -0.59771059447853869262 0.46799589598847113336 -0.38206338330827005478 0.59796056629836458196 -0.092183534775162723207 -0.72355845738311619364 -0.46550965706089836305 0.63830028439559793885 -0.24798181370146232805 0.41953723589077090983;0.10015768092995991356 -0.21607563735179230457 0.034814226389808786144 0.051051490749695525861 1.0836534770054255805 -0.092780145772327848874 0.032735832375032150598 1.2724671771232722861 -0.68020813147218750494 -0.35219939181807891071 -0.60994616713210925152 0.25108165267220927674 -0.12423691888720884979;-0.74820665015856124835 0.63243463863738358377 -0.56007052034986659628 0.24586770221421469507 -0.43873513194734287124 -0.85818536551250856892 -0.44582069652995987008 -0.06002909399381978206 -0.65987424073974532135 0.50190258793845166085 -0.084609649478188289629 -0.59368639878181617142 0.50769309411770913165;0.60483613327092089484 0.53152929813985339003 0.034344486832791579212 0.43816100414215058967 -0.45772147486366571156 -0.59928250319794296175 0.08438926951894849815 -0.62554126144505950435 0.4708284644081486281 -0.24075798258427483223 0.14964979996033431209 -0.88242826377118677161 0.67871902903948932995;0.50785041273028863618 0.5503473184083742531 0.51972607705779971798 0.13619042172705464466 0.60986994520641735207 -0.5324460040940879324 -0.33145758344893333502 0.57654208576406573705 0.016342897421097665744 -0.68875197459134362976 0.43541818274927290844 0.65298416756767752034 -0.43805568595073446359;-0.024813088925050633821 -0.41989267176429029282 -0.27216019061013280167 -0.57417908434159292685 0.19669067238376555795 0.4812425778973663526 0.64248986067751390205 0.050112013290985496505 0.48642045213467166587 0.63193600246614889393 -0.95837720923621616542 -0.21787883925505371896 -0.76912934890344275551;-0.071797283754273036327 0.40673428671379774357 0.43427080649805754886 -0.60889512939369039302 0.76030576735125932064 0.16413941264628831296 1.1077294280936524906 0.060935159762679248774 -0.12186478726830560215 0.12387716687650215941 0.83191366327528060154 0.51472671889309340454 -0.4240723763866617313;0.24531992848165365406 -0.81932877725218122844 0.13429303629768987727 0.064494400302746543452 -0.071925051604584802623 -0.085540881236168667123 0.57045909265696015389 -0.075642863075903468695 0.74617912432954769386 -0.26105260690981690885 -0.90004190372933445818 -0.69580762255447903275 -0.6151564472863461086;0.35882998327783899306 -0.27362965459072269292 -0.15534216511909221259 -0.3903294753001825268 0.6961163376012152737 -0.61945716994219701679 -0.18198009185905436591 0.55959159609390851653 0.095440288277298210295 -0.44330150595126038837 -0.76422467027539175977 0.86462000601493371743 -0.6272465739505075355;0.80849509915701789353 -0.78128865923958312756 0.066076652038424082969 0.11432662867081026803 -0.37326568087570910492 -0.42837778002308896097 -0.66613533683745485003 -0.4414241891597436851 -0.14105437954227206809 -0.79466175809201533564 0.027166714069464126952 -0.69413132216165740473 -0.15157134433564123377;-0.24826777139206485101 0.8686850174142005665 -0.40806241958916178447 -0.017902991348975775404 0.52119886990131725213 -0.13264359178194706779 0.15119781865901638085 -0.036368352476707832555 0.34090969364086753934 0.85203484875043722369 -0.25322921830301325929 -0.8460912834068263777 0.46009777711857335891;-0.093408311342742952887 0.15818206873164036841 0.050994295103658701662 -0.27778798898363654679 -0.59420886204080958226 -0.29333929056881297148 -0.26021256641298867729 0.64379334246171793232 -0.42297885595978906847 0.65811852315970797989 0.70370985430003929473 -0.66139133513138947951 -0.60570355970060352213;0.44038548788883125074 -0.65290735254492715534 0.76799337585310878396 0.053057133693357926008 -0.53879845000725756776 0.069101866894845584421 -0.83591946595904609296 0.08019682736267882972 -0.54592067580027303642 0.57426635867335729113 -0.38090116170123200501 0.086766784953368203404 -0.39800865882275632268;0.09739716714490075089 -0.41513492459614120822 -0.60920806535350691124 0.74203039644056978386 -0.36654237921687060631 -0.22530963510740567579 -0.5188847183025450116 0.67073016911673144502 0.53306835263354823695 0.72178836308518878884 -0.35576663148385728741 -0.0033034243099539038063 0.52625573312760498546;-0.80299564416098478947 0.017912188564262764012 0.51996686655146551193 -0.72556752249450318093 0.32082527074156697022 -1.0259130821245554532 0.49557546842958188904 0.29957477330418696981 0.35084873474985939223 -0.10231952337994076885 0.48976754495274221757 0.30445071207348539666 -0.2282882627402829101;0.58687889357731315432 -0.12980226054905485977 -0.57129969583708628544 0.77654568652717625987 0.44537177415064749253 0.32379987448812197481 -0.22508689924385386072 -0.61612251155460429075 -0.018248201418917368161 0.69630925854786218654 0.520162144616899913 -0.63345780264339024423 0.11129884031686484991;-0.57471528860823928309 0.56136567861918862388 -0.097503912557018970753 0.60603202891244423167 0.18383949260173526596 0.66397408482489550519 0.094149300550662742837 0.50833502123767848602 -0.69761065097343744057 0.74907677433881869611 -0.503642972059748395 0.40851381440526701727 0.0066723707942330356263;0.42022104143522109876 -0.30862227769387673426 0.51269751241062766489 0.41645721459586276803 0.097506045132738944359 0.020172334777525290778 -0.34930443551896922516 -0.44641777621988004698 -0.40670246925443870323 -0.87829771724921912313 -0.51248534686558355755 0.64931357850868798298 0.77952409655993648574;0.76865935176784172533 -0.48156654191144948607 -0.65513988230696618142 0.022172552932781131735 -0.6398702778462255214 0.32237478224147025907 -0.21922040556310301573 0.10200229434934771078 -0.91732159414818548182 -0.8032014354635126363 -0.22262218861994886865 0.42413652331990403521 0.25148410238307339348;0.72928572763965815451 -0.31611322402904190598 0.072539399238437274331 0.054529532510779070431 -0.58939208050712266207 0.037765135339962369043 -0.19374758585919948928 -0.59084155199568988426 -0.60750743159113251846 0.59413134531626998758 0.32569827043999477478 0.98446482074377694715 -0.58953219069812612396;0.87903641802087473245 0.038242645533610210296 -0.29117256432875321392 0.65200040820230165117 0.1074426473204364435 -0.57972874434376076014 -0.30645678156869016195 -0.71749969250401768317 0.04200971366610869312 -0.40371278063773347045 0.38963009756997207811 -0.37760087900585881382 -0.58855272181216256033;0.089840972926010481681 -0.6863313888445554678 -0.50984960593646255766 0.78051582891361237504 0.18826143531792643993 -0.40597286898715978509 0.27454937798229450685 -0.20918835329877771834 -0.11086220671047034014 -0.034221863971112639891 -0.071252670352690186673 -0.93005396751153324164 -0.78345471454812332102];

% Layer 3
b3 = [1.4139804038061418723;0.54448952618994161945;0.37097103592907421099;1.425643705920513149];
LW3_2 = [-0.40266635902335251584 0.22313993083270472484 -0.17349661501909169337 0.20967067139928605157 -0.036031998303199752609 -0.55574035825001388833 -0.27561910151638441269 0.31763548777533506806 -0.37151370640182157512 0.22104530874464231593 -0.1282534284425029536 -0.54158567342362062824 0.18117433569551341654 -0.24465802014126228348 0.14469433648695659289 -0.23739689085119164424 -0.43521591024630656985 -0.26246451234604334379 0.58208643527560555153 0.091103639925512791553 -0.41582643868094087969 -0.42678271232711356697 0.22432776597094866711 -0.26981633435247637243 -0.42541946486077114598 0.16899571658133274998;-0.44871847333439041083 0.33956176583747349484 0.3316236485437047965 0.048301571351166416868 0.55485049212439996325 -0.27923429736986399297 -0.61863843169218546425 -0.25953510078442171283 0.25349729869571724361 -0.036856656838358793638 -0.6632972570317147154 -0.32253110610488344712 0.53544852037461054817 0.31478858379089191821 -0.06760652162369185092 -0.00099221964346696668938 -0.25043718577641327361 -0.12927240039451862175 -0.28649919435969700698 -0.088060004549269335627 0.36828668383435181344 0.12537132904968190106 0.54583125465142978694 0.51194348904677189349 -0.21610816389615278288 -0.21873446578759797587;0.47513671028290871412 -0.56056773369608392521 0.25757494266850244902 0.17283741545026989894 -0.24753968049243454952 -0.084790853130978727226 -0.24775010788768708769 0.016664136558054577775 -0.29638286899825516674 0.30122858546320235851 -0.026880078427999207213 -0.47321730217198121338 0.052211464324771396373 0.079948144824548483811 0.081553927382702590121 0.50790521593270332446 0.26348682965975755987 -0.4899087630785475822 0.54588213199628177197 0.26029335376316248274 0.093407788655239368247 -0.20927492359718916082 -0.16701363865930007879 0.47917799302936403549 -0.12273143171158171216 -0.19596739732651458077;0.23624732952143470688 -0.45901905659621938804 -0.38349858439993389503 0.05436969680109056402 -0.34960920434309422644 0.30057847941676885117 0.30783372079693116508 0.48599902633443792244 0.098098426803046867573 -0.45860995203471072168 0.22990577914798773773 -0.058807473489406597578 0.48550686687364458249 0.56225671044417968591 -0.29782204515994514793 -0.093864302533029839171 -0.10155385312665272945 -0.41740727964774576586 0.14301061830223735227 0.33432965367147515767 -0.24273029486063479876 0.38594100030490435804 -0.25112704786367762155 0.037077990868609654596 -0.083756040000596498896 -0.17486629776195630748];

% Layer 4
b4 = [-0.38679485637357324812;-0.44671809720708693936];
LW4_3 = [0.59379531081068070986 0.90169143232116966136 0.22388582141415272475 -0.53412390126123043821;0.1291020492294664701 0.31507197362545646957 -0.92185203161568718411 0.30993579919304387049];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = [0.0138888888888889;0.031104199066874];
y1_step1.xoffset = [41;39];

% ===== SIMULATION ========

% Format Input Arguments
isCellX = iscell(X);
if ~isCellX
  X = {X};
end

% Dimensions
TS = size(X,2); % timesteps
if ~isempty(X)
  Q = size(X{1},2); % samples/series
else
  Q = 0;
end

% Allocate Outputs
Y = cell(1,TS);

% Time loop
for ts=1:TS

    % Input 1
    Xp1 = mapminmax_apply(X{1,ts},x1_step1);
    
    % Layer 1
    a1 = tansig_apply(repmat(b1,1,Q) + IW1_1*Xp1);
    
    % Layer 2
    a2 = tansig_apply(repmat(b2,1,Q) + LW2_1*a1);
    
    % Layer 3
    a3 = tansig_apply(repmat(b3,1,Q) + LW3_2*a2);
    
    % Layer 4
    a4 = repmat(b4,1,Q) + LW4_3*a3;
    
    % Output 1
    Y{1,ts} = mapminmax_reverse(a4,y1_step1);
end

% Final Delay States
Xf = cell(1,0);
Af = cell(4,0);

% Format Output Arguments
if ~isCellX
  Y = cell2mat(Y);
end
end

% ===== MODULE FUNCTIONS ========

% Map Minimum and Maximum Input Processing Function
function y = mapminmax_apply(x,settings)
  y = bsxfun(@minus,x,settings.xoffset);
  y = bsxfun(@times,y,settings.gain);
  y = bsxfun(@plus,y,settings.ymin);
end

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n,~)
  a = 2 ./ (1 + exp(-2*n)) - 1;
end

% Map Minimum and Maximum Output Reverse-Processing Function
function x = mapminmax_reverse(y,settings)
  x = bsxfun(@minus,y,settings.ymin);
  x = bsxfun(@rdivide,x,settings.gain);
  x = bsxfun(@plus,x,settings.xoffset);
end