{\rtf1\ansi\ansicpg1252\deff0\nouicompat{\fonttbl{\f0\fnil\fcharset0 Calibri;}}
{\colortbl ;\red0\green0\blue255;}
{\*\generator Riched20 10.0.19041}\viewkind4\uc1 
\pard\sa200\sl276\slmult1\f0\fs22\lang38 */\par
//\par
// Website : {{\field{\*\fldinst{HYPERLINK https://NarakaToken.com }}{\fldrslt{https://NarakaToken.com\ul0\cf0}}}}\f0\fs22\par
// Twitter : twitter.com/NarakaTokenInfo\par
// Telegram: {{\field{\*\fldinst{HYPERLINK https://t.me/NarakaTokenOfficial }}{\fldrslt{https://t.me/NarakaTokenOfficial\ul0\cf0}}}}\f0\fs22\par
//\par
// SPDX-License-Identifier: MIT\par
pragma solidity ^0.8.4;\par
\par
abstract contract Context \{\par
    function _msgSender() internal view virtual returns (address payable) \{\par
        return payable(msg.sender);\par
    \}\par
\par
    function _msgData() internal view virtual returns (bytes memory) \{\par
        this; // silence state mutability warning without generating bytecode - see {{\field{\*\fldinst{HYPERLINK https://github.com/ethereum/solidity/issues/2691 }}{\fldrslt{https://github.com/ethereum/solidity/issues/2691\ul0\cf0}}}}\f0\fs22\par
        return msg.data;\par
    \}\par
\}\par
\par
\par
interface IERC20 \{\par
\par
    function totalSupply() external view returns (uint256);\par
    function balanceOf(address account) external view returns (uint256);\par
    function transfer(address recipient, uint256 amount) external returns (bool);\par
    function allowance(address owner, address spender) external view returns (uint256);\par
    function approve(address spender, uint256 amount) external returns (bool);\par
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);\par
    event Transfer(address indexed from, address indexed to, uint256 value);\par
    event Approval(address indexed owner, address indexed spender, uint256 value);\par
    \par
\par
\}\par
\par
library SafeMath \{\par
\par
    function add(uint256 a, uint256 b) internal pure returns (uint256) \{\par
        uint256 c = a + b;\par
        require(c >= a, "SafeMath: addition overflow");\par
\par
        return c;\par
    \}\par
\par
    function sub(uint256 a, uint256 b) internal pure returns (uint256) \{\par
        return sub(a, b, "SafeMath: subtraction overflow");\par
    \}\par
\par
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) \{\par
        require(b <= a, errorMessage);\par
        uint256 c = a - b;\par
\par
        return c;\par
    \}\par
\par
    function mul(uint256 a, uint256 b) internal pure returns (uint256) \{\par
        if (a == 0) \{\par
            return 0;\par
        \}\par
\par
        uint256 c = a * b;\par
        require(c / a == b, "SafeMath: multiplication overflow");\par
\par
        return c;\par
    \}\par
\par
\par
    function div(uint256 a, uint256 b) internal pure returns (uint256) \{\par
        return div(a, b, "SafeMath: division by zero");\par
    \}\par
\par
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) \{\par
        require(b > 0, errorMessage);\par
        uint256 c = a / b;\par
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold\par
\par
        return c;\par
    \}\par
\par
    function mod(uint256 a, uint256 b) internal pure returns (uint256) \{\par
        return mod(a, b, "SafeMath: modulo by zero");\par
    \}\par
\par
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) \{\par
        require(b != 0, errorMessage);\par
        return a % b;\par
    \}\par
\}\par
\par
library Address \{\par
\par
    function isContract(address account) internal view returns (bool) \{\par
        // According to EIP-1052, 0x0 is the value returned for not-yet created accounts\par
        // and 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 is returned\par
        // for accounts without code, i.e. `keccak256('')`\par
        bytes32 codehash;\par
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;\par
        // solhint-disable-next-line no-inline-assembly\par
        assembly \{ codehash := extcodehash(account) \}\par
        return (codehash != accountHash && codehash != 0x0);\par
    \}\par
\par
    function sendValue(address payable recipient, uint256 amount) internal \{\par
        require(address(this).balance >= amount, "Address: insufficient balance");\par
\par
        // solhint-disable-next-line avoid-low-level-calls, avoid-call-value\par
        (bool success, ) = recipient.call\{ value: amount \}("");\par
        require(success, "Address: unable to send value, recipient may have reverted");\par
    \}\par
\par
\par
    function functionCall(address target, bytes memory data) internal returns (bytes memory) \{\par
      return functionCall(target, data, "Address: low-level call failed");\par
    \}\par
\par
    function functionCall(address target, bytes memory data, string memory errorMessage) internal returns (bytes memory) \{\par
        return _functionCallWithValue(target, data, 0, errorMessage);\par
    \}\par
\par
    function functionCallWithValue(address target, bytes memory data, uint256 value) internal returns (bytes memory) \{\par
        return functionCallWithValue(target, data, value, "Address: low-level call with value failed");\par
    \}\par
\par
    function functionCallWithValue(address target, bytes memory data, uint256 value, string memory errorMessage) internal returns (bytes memory) \{\par
        require(address(this).balance >= value, "Address: insufficient balance for call");\par
        return _functionCallWithValue(target, data, value, errorMessage);\par
    \}\par
\par
    function _functionCallWithValue(address target, bytes memory data, uint256 weiValue, string memory errorMessage) private returns (bytes memory) \{\par
        require(isContract(target), "Address: call to non-contract");\par
\par
        (bool success, bytes memory returndata) = target.call\{ value: weiValue \}(data);\par
        if (success) \{\par
            return returndata;\par
        \} else \{\par
            \par
            if (returndata.length > 0) \{\par
                assembly \{\par
                    let returndata_size := mload(returndata)\par
                    revert(add(32, returndata), returndata_size)\par
                \}\par
            \} else \{\par
                revert(errorMessage);\par
            \}\par
        \}\par
    \}\par
\}\par
\par
contract Ownable is Context \{\par
    address private _owner;\par
    address private _previousOwner;\par
    uint256 private _lockTime;\par
\par
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);\par
\par
    constructor () \{\par
        address msgSender = _msgSender();\par
        _owner = msgSender;\par
        emit OwnershipTransferred(address(0), msgSender);\par
    \}\par
\par
    function owner() public view returns (address) \{\par
        return _owner;\par
    \}   \par
    \par
    modifier onlyOwner() \{\par
        require(_owner == _msgSender(), "Ownable: caller is not the owner");\par
        _;\par
    \}\par
    \par
    function renounceOwnership() public virtual onlyOwner \{\par
        emit OwnershipTransferred(_owner, address(0));\par
        _owner = address(0);\par
    \}\par
\par
    function transferOwnership(address newOwner) public virtual onlyOwner \{\par
        require(newOwner != address(0), "Ownable: new owner is the zero address");\par
        emit OwnershipTransferred(_owner, newOwner);\par
        _owner = newOwner;\par
    \}\par
\}\par
\par
// pragma solidity >=0.5.0;\par
\par
interface IUniswapV2Factory \{\par
    event PairCreated(address indexed token0, address indexed token1, address pair, uint);\par
\par
    function feeTo() external view returns (address);\par
    function feeToSetter() external view returns (address);\par
\par
    function getPair(address tokenA, address tokenB) external view returns (address pair);\par
    function allPairs(uint) external view returns (address pair);\par
    function allPairsLength() external view returns (uint);\par
\par
    function createPair(address tokenA, address tokenB) external returns (address pair);\par
\par
    function setFeeTo(address) external;\par
    function setFeeToSetter(address) external;\par
\}\par
\par
\par
// pragma solidity >=0.5.0;\par
\par
interface IUniswapV2Pair \{\par
    event Approval(address indexed owner, address indexed spender, uint value);\par
    event Transfer(address indexed from, address indexed to, uint value);\par
\par
    function name() external pure returns (string memory);\par
    function symbol() external pure returns (string memory);\par
    function decimals() external pure returns (uint8);\par
    function totalSupply() external view returns (uint);\par
    function balanceOf(address owner) external view returns (uint);\par
    function allowance(address owner, address spender) external view returns (uint);\par
\par
    function approve(address spender, uint value) external returns (bool);\par
    function transfer(address to, uint value) external returns (bool);\par
    function transferFrom(address from, address to, uint value) external returns (bool);\par
\par
    function DOMAIN_SEPARATOR() external view returns (bytes32);\par
    function PERMIT_TYPEHASH() external pure returns (bytes32);\par
    function nonces(address owner) external view returns (uint);\par
\par
    function permit(address owner, address spender, uint value, uint deadline, uint8 v, bytes32 r, bytes32 s) external;\par
    \par
    event Burn(address indexed sender, uint amount0, uint amount1, address indexed to);\par
    event Swap(\par
        address indexed sender,\par
        uint amount0In,\par
        uint amount1In,\par
        uint amount0Out,\par
        uint amount1Out,\par
        address indexed to\par
    );\par
    event Sync(uint112 reserve0, uint112 reserve1);\par
\par
    function MINIMUM_LIQUIDITY() external pure returns (uint);\par
    function factory() external view returns (address);\par
    function token0() external view returns (address);\par
    function token1() external view returns (address);\par
    function getReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);\par
    function price0CumulativeLast() external view returns (uint);\par
    function price1CumulativeLast() external view returns (uint);\par
    function kLast() external view returns (uint);\par
\par
    function burn(address to) external returns (uint amount0, uint amount1);\par
    function swap(uint amount0Out, uint amount1Out, address to, bytes calldata data) external;\par
    function skim(address to) external;\par
    function sync() external;\par
\par
    function initialize(address, address) external;\par
\}\par
\par
// pragma solidity >=0.6.2;\par
\par
interface IUniswapV2Router01 \{\par
    function factory() external pure returns (address);\par
    function WETH() external pure returns (address);\par
\par
    function addLiquidity(\par
        address tokenA,\par
        address tokenB,\par
        uint amountADesired,\par
        uint amountBDesired,\par
        uint amountAMin,\par
        uint amountBMin,\par
        address to,\par
        uint deadline\par
    ) external returns (uint amountA, uint amountB, uint liquidity);\par
    function addLiquidityETH(\par
        address token,\par
        uint amountTokenDesired,\par
        uint amountTokenMin,\par
        uint amountETHMin,\par
        address to,\par
        uint deadline\par
    ) external payable returns (uint amountToken, uint amountETH, uint liquidity);\par
    function removeLiquidity(\par
        address tokenA,\par
        address tokenB,\par
        uint liquidity,\par
        uint amountAMin,\par
        uint amountBMin,\par
        address to,\par
        uint deadline\par
    ) external returns (uint amountA, uint amountB);\par
    function removeLiquidityETH(\par
        address token,\par
        uint liquidity,\par
        uint amountTokenMin,\par
        uint amountETHMin,\par
        address to,\par
        uint deadline\par
    ) external returns (uint amountToken, uint amountETH);\par
    function removeLiquidityWithPermit(\par
        address tokenA,\par
        address tokenB,\par
        uint liquidity,\par
        uint amountAMin,\par
        uint amountBMin,\par
        address to,\par
        uint deadline,\par
        bool approveMax, uint8 v, bytes32 r, bytes32 s\par
    ) external returns (uint amountA, uint amountB);\par
    function removeLiquidityETHWithPermit(\par
        address token,\par
        uint liquidity,\par
        uint amountTokenMin,\par
        uint amountETHMin,\par
        address to,\par
        uint deadline,\par
        bool approveMax, uint8 v, bytes32 r, bytes32 s\par
    ) external returns (uint amountToken, uint amountETH);\par
    function swapExactTokensForTokens(\par
        uint amountIn,\par
        uint amountOutMin,\par
        address[] calldata path,\par
        address to,\par
        uint deadline\par
    ) external returns (uint[] memory amounts);\par
    function swapTokensForExactTokens(\par
        uint amountOut,\par
        uint amountInMax,\par
        address[] calldata path,\par
        address to,\par
        uint deadline\par
    ) external returns (uint[] memory amounts);\par
    function swapExactETHForTokens(uint amountOutMin, address[] calldata path, address to, uint deadline)\par
        external\par
        payable\par
        returns (uint[] memory amounts);\par
    function swapTokensForExactETH(uint amountOut, uint amountInMax, address[] calldata path, address to, uint deadline)\par
        external\par
        returns (uint[] memory amounts);\par
    function swapExactTokensForETH(uint amountIn, uint amountOutMin, address[] calldata path, address to, uint deadline)\par
        external\par
        returns (uint[] memory amounts);\par
    function swapETHForExactTokens(uint amountOut, address[] calldata path, address to, uint deadline)\par
        external\par
        payable\par
        returns (uint[] memory amounts);\par
\par
    function quote(uint amountA, uint reserveA, uint reserveB) external pure returns (uint amountB);\par
    function getAmountOut(uint amountIn, uint reserveIn, uint reserveOut) external pure returns (uint amountOut);\par
    function getAmountIn(uint amountOut, uint reserveIn, uint reserveOut) external pure returns (uint amountIn);\par
    function getAmountsOut(uint amountIn, address[] calldata path) external view returns (uint[] memory amounts);\par
    function getAmountsIn(uint amountOut, address[] calldata path) external view returns (uint[] memory amounts);\par
\}\par
\par
\par
\par
// pragma solidity >=0.6.2;\par
\par
interface IUniswapV2Router02 is IUniswapV2Router01 \{\par
    function removeLiquidityETHSupportingFeeOnTransferTokens(\par
        address token,\par
        uint liquidity,\par
        uint amountTokenMin,\par
        uint amountETHMin,\par
        address to,\par
        uint deadline\par
    ) external returns (uint amountETH);\par
    function removeLiquidityETHWithPermitSupportingFeeOnTransferTokens(\par
        address token,\par
        uint liquidity,\par
        uint amountTokenMin,\par
        uint amountETHMin,\par
        address to,\par
        uint deadline,\par
        bool approveMax, uint8 v, bytes32 r, bytes32 s\par
    ) external returns (uint amountETH);\par
\par
    function swapExactTokensForTokensSupportingFeeOnTransferTokens(\par
        uint amountIn,\par
        uint amountOutMin,\par
        address[] calldata path,\par
        address to,\par
        uint deadline\par
    ) external;\par
    function swapExactETHForTokensSupportingFeeOnTransferTokens(\par
        uint amountOutMin,\par
        address[] calldata path,\par
        address to,\par
        uint deadline\par
    ) external payable;\par
    function swapExactTokensForETHSupportingFeeOnTransferTokens(\par
        uint amountIn,\par
        uint amountOutMin,\par
        address[] calldata path,\par
        address to,\par
        uint deadline\par
    ) external;\par
\}\par
\par
contract NarakaToken is Context, IERC20, Ownable \{\par
    using SafeMath for uint256;\par
    using Address for address;\par
    \par
    address payable private marketingWallet = payable(0x5509709A9EEF8C2A2449c23d5cE2b38d42bB90D5); // Marketing Wallet\par
    address payable private ecosystemWallet = payable(0x4892cf4405947bAF9540bb04d254b328899bBC52); // Ecosystem Wallet\par
    address payable private devWallet = payable (0x5509709A9EEF8C2A2449c23d5cE2b38d42bB90D5); // dev Wallet\par
    mapping (address => uint256) private _rOwned;\par
    mapping (address => uint256) private _tOwned;\par
    mapping (address => mapping (address => uint256)) private _allowances;\par
    mapping (address => bool) private _isSniper;\par
    \par
    uint256 public deadBlocks = 2;\par
    uint256 public launchedAt = 0;\par
    \par
\par
    mapping (address => bool) private _isExcludedFromFee;\par
    mapping (address => bool) private _isMaxWalletExempt;\par
    mapping (address => bool) private _isExcluded;\par
    mapping (address => bool) private _isTrusted;\par
    address[] private _excluded;\par
   \par
    address DEAD = 0x000000000000000000000000000000000000dEaD;\par
\par
    uint8 private _decimals = 9;\par
    \par
    uint256 private constant MAX = ~uint256(0);\par
    uint256 private _tTotal = 100000000000000000 * 10**_decimals;\par
    uint256 private _rTotal = (MAX - (MAX % _tTotal));\par
    uint256 private _tFeeTotal;\par
\par
    string private _name = "NarakaToken";\par
    string private _symbol = "NT";\par
    \par
\par
    uint256 public _maxWalletToken = _tTotal.div(1000).mul(2); //0.2% for first few mins\par
\par
    uint256 public _buyLiquidityFee = 30;\par
    uint256 public _buyDevFee = 0;     \par
    uint256 public _buyMarketingFee = 40;   //4%\par
    uint256 public _buyReflectionFee = 10;\par
    uint256 public _buyEcosystemFee = 40;\par
\par
    uint256 public _sellLiquidityFee = 30;\par
    uint256 public _sellMarketingFee = 40;  \par
    uint256 public _sellDevFee = 0;   \par
    uint256 public _sellReflectionFee = 10;\par
    uint256 public _sellEcosystemFee =40;\par
    \par
    uint256 private ecosystemFee = _buyEcosystemFee;  \par
    uint256 private liquidityFee = _buyLiquidityFee;\par
    uint256 private marketingFee = _buyMarketingFee;\par
    uint256 private devFee = _buyDevFee;\par
    uint256 private reflectionFee=_buyReflectionFee;\par
\par
\par
    uint256 private totalFee =\par
        liquidityFee.add(marketingFee).add(devFee).add(ecosystemFee);\par
    uint256 private currenttotalFee = totalFee;\par
    \par
    uint256 public swapThreshold = _tTotal.div(10000).mul(5); //0.05%\par
   \par
    IUniswapV2Router02 public uniswapV2Router;\par
    address public uniswapV2Pair;\par
    \par
    bool inSwap;\par
    \par
    bool public tradingOpen = false;\par
    bool public zeroBuyTaxmode = false;\par
    bool private antiBotmode = true;\par
    \par
    event SwapETHForTokens(\par
        uint256 amountIn,\par
        address[] path\par
    );\par
    \par
    event SwapTokensForETH(\par
        uint256 amountIn,\par
        address[] path\par
    );\par
    \par
    modifier lockTheSwap \{\par
        inSwap = true;\par
        _;\par
        inSwap = false;\par
    \}\par
    \par
\par
    constructor () \{\par
\par
        _rOwned[_msgSender()] = _rTotal;\par
        IUniswapV2Router02 _uniswapV2Router = IUniswapV2Router02(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);\par
        uniswapV2Pair = IUniswapV2Factory(_uniswapV2Router.factory())\par
        .createPair(address(this), _uniswapV2Router.WETH());\par
\par
        uniswapV2Router = _uniswapV2Router;\par
\par
        _isExcludedFromFee[owner()] = true;\par
        _isExcludedFromFee[address(this)] = true;\par
        _isMaxWalletExempt[owner()] = true;\par
        _isMaxWalletExempt[address(this)] = true;\par
        _isMaxWalletExempt[uniswapV2Pair] = true;\par
        _isMaxWalletExempt[DEAD] = true;\par
        _isTrusted[owner()] = true;\par
        _isTrusted[uniswapV2Pair] = true;\par
\par
        emit Transfer(address(0), _msgSender(), _tTotal);\par
    \}\par
    \par
    function openTrading(bool _status,uint256 _deadBlocks) external onlyOwner() \{\par
        tradingOpen = _status;\par
        excludeFromReward(address(this));\par
        excludeFromReward(uniswapV2Pair);\par
        if(tradingOpen && launchedAt == 0)\{\par
            launchedAt = block.number;\par
            deadBlocks = _deadBlocks;\par
        \}\par
    \}\par
\par
    \par
    function setZeroBuyTaxmode(bool _status) external onlyOwner() \{\par
       zeroBuyTaxmode=_status;\par
    \}\par
\par
    function setAntiBotmode(bool _status) external onlyOwner() \{\par
       antiBotmode=_status;\par
    \}\par
    \par
    function setNewRouter(address newRouter) external onlyOwner() \{\par
        IUniswapV2Router02 _newRouter = IUniswapV2Router02(newRouter);\par
        address get_pair = IUniswapV2Factory(_newRouter.factory()).getPair(address(this), _newRouter.WETH());\par
        if (get_pair == address(0)) \{\par
            uniswapV2Pair = IUniswapV2Factory(_newRouter.factory()).createPair(address(this), _newRouter.WETH());\par
        \}\par
        else \{\par
            uniswapV2Pair = get_pair;\par
        \}\par
        uniswapV2Router = _newRouter;\par
    \}\par
\par
    function name() public view returns (string memory) \{\par
        return _name;\par
    \}\par
\par
    function symbol() public view returns (string memory) \{\par
        return _symbol;\par
    \}\par
\par
    function decimals() public view returns (uint8) \{\par
        return _decimals;\par
    \}\par
\par
    function totalSupply() public view override returns (uint256) \{\par
        return _tTotal;\par
    \}\par
\par
    function balanceOf(address account) public view override returns (uint256) \{\par
        if (_isExcluded[account]) return _tOwned[account];\par
        return tokenFromReflection(_rOwned[account]);\par
    \}\par
\par
    function transfer(address recipient, uint256 amount) public override returns (bool) \{\par
        _transfer(_msgSender(), recipient, amount);\par
        return true;\par
    \}\par
\par
    function allowance(address owner, address spender) public view override returns (uint256) \{\par
        return _allowances[owner][spender];\par
    \}\par
\par
    function approve(address spender, uint256 amount) public override returns (bool) \{\par
        _approve(_msgSender(), spender, amount);\par
        return true;\par
    \}\par
\par
    function transferFrom(address sender, address recipient, uint256 amount) public override returns (bool) \{\par
        _transfer(sender, recipient, amount);\par
        _approve(sender, _msgSender(), _allowances[sender][_msgSender()].sub(amount, "ERC20: transfer amount exceeds allowance"));\par
        return true;\par
    \}\par
\par
    function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool) \{\par
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].add(addedValue));\par
        return true;\par
    \}\par
\par
    function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) \{\par
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].sub(subtractedValue, "ERC20: decreased allowance below zero"));\par
        return true;\par
    \}\par
\par
    function isExcludedFromReward(address account) public view returns (bool) \{\par
        return _isExcluded[account];\par
    \}\par
\par
    function totalFees() public view returns (uint256) \{\par
        return _tFeeTotal;\par
    \}\par
    \par
    function deliver(uint256 tAmount) public \{\par
        address sender = _msgSender();\par
        require(!_isExcluded[sender], "Excluded addresses cannot call this function");\par
        (uint256 rAmount,,,,,) = _getValues(tAmount);\par
        _rOwned[sender] = _rOwned[sender].sub(rAmount);\par
        _rTotal = _rTotal.sub(rAmount);\par
        _tFeeTotal = _tFeeTotal.add(tAmount);\par
    \}\par
  \par
\par
    function reflectionFromToken(uint256 tAmount, bool deductTransferFee) public view returns(uint256) \{\par
        require(tAmount <= _tTotal, "Amount must be less than supply");\par
        if (!deductTransferFee) \{\par
            (uint256 rAmount,,,,,) = _getValues(tAmount);\par
            return rAmount;\par
        \} else \{\par
            (,uint256 rTransferAmount,,,,) = _getValues(tAmount);\par
            return rTransferAmount;\par
        \}\par
    \}\par
\par
    function tokenFromReflection(uint256 rAmount) public view returns(uint256) \{\par
        require(rAmount <= _rTotal, "Amount must be less than total reflections");\par
        uint256 currentRate =  _getRate();\par
        return rAmount.div(currentRate);\par
    \}\par
\par
    function excludeFromReward(address account) public onlyOwner() \{\par
\par
        if(_rOwned[account] > 0) \{\par
            _tOwned[account] = tokenFromReflection(_rOwned[account]);\par
        \}\par
        _isExcluded[account] = true;\par
        _excluded.push(account);\par
    \}\par
\par
    function includeInReward(address account) external onlyOwner() \{\par
        require(_isExcluded[account], "Account is already excluded");\par
        for (uint256 i = 0; i < _excluded.length; i++) \{\par
            if (_excluded[i] == account) \{\par
                _excluded[i] = _excluded[_excluded.length - 1];\par
                _tOwned[account] = 0;\par
                _isExcluded[account] = false;\par
                _excluded.pop();\par
                break;\par
            \}\par
        \}\par
    \}\par
\par
    function _approve(address owner, address spender, uint256 amount) private \{\par
        require(owner != address(0), "ERC20: approve from the zero address");\par
        require(spender != address(0), "ERC20: approve to the zero address");\par
\par
        _allowances[owner][spender] = amount;\par
        emit Approval(owner, spender, amount);\par
    \}\par
\par
    function _transfer(\par
        address from,\par
        address to,\par
        uint256 amount\par
    ) private \{\par
        require(from != address(0), "ERC20: transfer from the zero address");\par
        require(to != address(0), "ERC20: transfer to the zero address");\par
        require(amount > 0, "Transfer amount must be greater than zero");\par
        require(!_isSniper[to], "You have no power here!");\par
        require(!_isSniper[from], "You have no power here!");\par
        if (from!= owner() && to!= owner()) require(tradingOpen, "Trading not yet enabled."); //transfers disabled before openTrading\par
        \par
         bool takeFee = false;\par
        //take fee only on swaps\par
        if ( (from==uniswapV2Pair || to==uniswapV2Pair) && !(_isExcludedFromFee[from] || _isExcludedFromFee[to]) ) \{\par
            takeFee = true;\par
        \}\par
\par
        if(launchedAt>0 && (!_isMaxWalletExempt[to] && from!= owner()) && !((launchedAt + deadBlocks) > block.number))\{\par
                require(amount+ balanceOf(to)<=_maxWalletToken,\par
                    "Total Holding is currently limited");\par
        \}\par
        \par
\par
        currenttotalFee=totalFee;\par
        reflectionFee=_buyReflectionFee;\par
\par
        if(tradingOpen && to == uniswapV2Pair) \{ //sell\par
            currenttotalFee= _sellLiquidityFee.add(_sellMarketingFee).add(_sellDevFee).add(_sellEcosystemFee);\par
            reflectionFee=_sellReflectionFee;\par
        \}\par
        \par
        //antibot - first 2 blocks\par
        if(launchedAt>0 && (launchedAt + deadBlocks) > block.number)\{\par
                _isSniper[to]=true;\par
        \}\par
        \par
        //Punish high slippage bots for next - only bot txns go through here\par
        if(launchedAt>0 && from!= owner() && block.number >= (launchedAt + deadBlocks)  && antiBotmode)\{\par
                currenttotalFee=900;    //90%\par
        \}\par
\par
        if(zeroBuyTaxmode)\{\par
             if(tradingOpen && from == uniswapV2Pair) \{ //buys\par
                    currenttotalFee=0;\par
             \}\par
        \}\par
\par
        //sell\par
        if (!inSwap && tradingOpen && to == uniswapV2Pair) \{\par
      \par
            uint256 contractTokenBalance = balanceOf(address(this));\par
            \par
            if(contractTokenBalance>=swapThreshold)\{\par
                    contractTokenBalance = swapThreshold;\par
                    swapTokens(contractTokenBalance);\par
            \}\par
          \par
        \}\par
        _tokenTransfer(from,to,amount,takeFee);\par
    \}\par
\par
    function swapTokens(uint256 contractTokenBalance) private lockTheSwap \{\par
        \par
        \par
        uint256 amountToLiquify = contractTokenBalance\par
            .mul(liquidityFee)\par
            .div(totalFee)\par
            .div(2);\par
\par
        uint256 amountToSwap = contractTokenBalance.sub(amountToLiquify);\par
        \par
        swapTokensForEth(amountToSwap);\par
\par
        uint256 amountETH = address(this).balance;\par
\par
        uint256 totalETHFee = totalFee.sub(liquidityFee.div(2));\par
\par
        uint256 amountETHLiquidity = amountETH\par
            .mul(liquidityFee)\par
            .div(totalETHFee)\par
            .div(2);\par
        \par
        uint256 amountETHdev = amountETH.mul(devFee).div(totalETHFee);\par
        uint256 amountETHMarketing = amountETH.mul(marketingFee).div(\par
            totalETHFee\par
        );\par
         uint256 amountETHEcosystem = amountETH.mul(ecosystemFee).div(\par
            totalETHFee\par
        );\par
        //Send to marketing wallet and dev wallet\par
        uint256 contractETHBalance = address(this).balance;\par
        if(contractETHBalance > 0) \{\par
            sendETHToFee(amountETHMarketing,marketingWallet);\par
            sendETHToFee(amountETHEcosystem,ecosystemWallet);\par
            sendETHToFee(amountETHdev,devWallet);\par
        \}\par
        if (amountToLiquify > 0) \{\par
                addLiquidity(amountToLiquify,amountETHLiquidity);\par
        \}\par
    \}\par
    \par
    function sendETHToFee(uint256 amount,address payable wallet) private \{\par
        wallet.transfer(amount);\par
    \}\par
    \par
\par
   \par
    function swapTokensForEth(uint256 tokenAmount) private \{\par
        // generate the uniswap pair path of token -> weth\par
        address[] memory path = new address[](2);\par
        path[0] = address(this);\par
        path[1] = uniswapV2Router.WETH();\par
\par
        _approve(address(this), address(uniswapV2Router), tokenAmount);\par
\par
        // make the swap\par
        uniswapV2Router.swapExactTokensForETHSupportingFeeOnTransferTokens(\par
            tokenAmount,\par
            0, // accept any amount of ETH\par
            path,\par
            address(this), // The contract\par
            block.timestamp\par
        );\par
        \par
        emit SwapTokensForETH(tokenAmount, path);\par
    \}\par
    \par
\par
    function addLiquidity(uint256 tokenAmount, uint256 ethAmount) private \{\par
        // approve token transfer to cover all possible scenarios\par
        _approve(address(this), address(uniswapV2Router), tokenAmount);\par
\par
        // add the liquidity\par
        uniswapV2Router.addLiquidityETH\{value: ethAmount\}(\par
            address(this),\par
            tokenAmount,\par
            0, // slippage is unavoidable\par
            0, // slippage is unavoidable\par
            owner(),\par
            block.timestamp\par
        );\par
    \}\par
\par
    function _tokenTransfer(address sender, address recipient, uint256 amount,bool takeFee) private \{\par
\par
        uint256 _previousReflectionFee=reflectionFee;\par
        uint256 _previousTotalFee=currenttotalFee;\par
        if(!takeFee)\{\par
            reflectionFee = 0;\par
            currenttotalFee=0;\par
        \}\par
        \par
        if (_isExcluded[sender] && !_isExcluded[recipient]) \{\par
            _transferFromExcluded(sender, recipient, amount);\par
        \} else if (!_isExcluded[sender] && _isExcluded[recipient]) \{\par
            _transferToExcluded(sender, recipient, amount);\par
        \} else if (_isExcluded[sender] && _isExcluded[recipient]) \{\par
            _transferBothExcluded(sender, recipient, amount);\par
        \} else \{\par
            _transferStandard(sender, recipient, amount);\par
        \}\par
        \par
        if(!takeFee)\{\par
            reflectionFee = _previousReflectionFee;\par
            currenttotalFee=_previousTotalFee;\par
        \}\par
    \}\par
\par
    function _transferStandard(address sender, address recipient, uint256 tAmount) private \{\par
        (uint256 rAmount, uint256 rTransferAmount, uint256 rFee, uint256 tTransferAmount, uint256 tFee, uint256 tLiquidity) = _getValues(tAmount);\par
        _rOwned[sender] = _rOwned[sender].sub(rAmount);\par
        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);\par
        _takeLiquidity(tLiquidity);\par
        _reflectFee(rFee, tFee);\par
        emit Transfer(sender, recipient, tTransferAmount);\par
    \}\par
\par
    function _transferToExcluded(address sender, address recipient, uint256 tAmount) private \{\par
        (uint256 rAmount, uint256 rTransferAmount, uint256 rFee, uint256 tTransferAmount, uint256 tFee, uint256 tLiquidity) = _getValues(tAmount);\par
        _rOwned[sender] = _rOwned[sender].sub(rAmount);\par
        _tOwned[recipient] = _tOwned[recipient].add(tTransferAmount);\par
        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);           \par
        _takeLiquidity(tLiquidity);\par
        _reflectFee(rFee, tFee);\par
        emit Transfer(sender, recipient, tTransferAmount);\par
    \}\par
\par
    function _transferFromExcluded(address sender, address recipient, uint256 tAmount) private \{\par
        (uint256 rAmount, uint256 rTransferAmount, uint256 rFee, uint256 tTransferAmount, uint256 tFee, uint256 tLiquidity) = _getValues(tAmount);\par
        _tOwned[sender] = _tOwned[sender].sub(tAmount);\par
        _rOwned[sender] = _rOwned[sender].sub(rAmount);\par
        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);   \par
        _takeLiquidity(tLiquidity);\par
        _reflectFee(rFee, tFee);\par
        emit Transfer(sender, recipient, tTransferAmount);\par
    \}\par
\par
    function _transferBothExcluded(address sender, address recipient, uint256 tAmount) private \{\par
        (uint256 rAmount, uint256 rTransferAmount, uint256 rFee, uint256 tTransferAmount, uint256 tFee, uint256 tLiquidity) = _getValues(tAmount);\par
        _tOwned[sender] = _tOwned[sender].sub(tAmount);\par
        _rOwned[sender] = _rOwned[sender].sub(rAmount);\par
        _tOwned[recipient] = _tOwned[recipient].add(tTransferAmount);\par
        _rOwned[recipient] = _rOwned[recipient].add(rTransferAmount);        \par
        _takeLiquidity(tLiquidity);\par
        _reflectFee(rFee, tFee);\par
        emit Transfer(sender, recipient, tTransferAmount);\par
    \}\par
\par
    function _reflectFee(uint256 rFee, uint256 tFee) private \{\par
        _rTotal = _rTotal.sub(rFee);\par
        _tFeeTotal = _tFeeTotal.add(tFee);\par
    \}\par
\par
    function _getValues(uint256 tAmount) private view returns (uint256, uint256, uint256, uint256, uint256, uint256) \{\par
        (uint256 tTransferAmount, uint256 tFee, uint256 tLiquidity) = _getTValues(tAmount);\par
        (uint256 rAmount, uint256 rTransferAmount, uint256 rFee) = _getRValues(tAmount, tFee, tLiquidity, _getRate());\par
        return (rAmount, rTransferAmount, rFee, tTransferAmount, tFee, tLiquidity);\par
    \}\par
\par
    function _getTValues(uint256 tAmount) private view returns (uint256, uint256, uint256) \{\par
        uint256 tFee = calculateTaxFee(tAmount);\par
        uint256 tLiquidity = calculateLiquidityFee(tAmount);\par
        uint256 tTransferAmount = tAmount.sub(tFee).sub(tLiquidity);\par
        return (tTransferAmount, tFee, tLiquidity);\par
    \}\par
\par
    function _getRValues(uint256 tAmount, uint256 tFee, uint256 tLiquidity, uint256 currentRate) private pure returns (uint256, uint256, uint256) \{\par
        uint256 rAmount = tAmount.mul(currentRate);\par
        uint256 rFee = tFee.mul(currentRate);\par
        uint256 rLiquidity = tLiquidity.mul(currentRate);\par
        uint256 rTransferAmount = rAmount.sub(rFee).sub(rLiquidity);\par
        return (rAmount, rTransferAmount, rFee);\par
    \}\par
\par
    function _getRate() private view returns(uint256) \{\par
        (uint256 rSupply, uint256 tSupply) = _getCurrentSupply();\par
        return rSupply.div(tSupply);\par
    \}\par
\par
    function _getCurrentSupply() private view returns(uint256, uint256) \{\par
        uint256 rSupply = _rTotal;\par
        uint256 tSupply = _tTotal;      \par
        for (uint256 i = 0; i < _excluded.length; i++) \{\par
            if (_rOwned[_excluded[i]] > rSupply || _tOwned[_excluded[i]] > tSupply) return (_rTotal, _tTotal);\par
            rSupply = rSupply.sub(_rOwned[_excluded[i]]);\par
            tSupply = tSupply.sub(_tOwned[_excluded[i]]);\par
        \}\par
        if (rSupply < _rTotal.div(_tTotal)) return (_rTotal, _tTotal);\par
        return (rSupply, tSupply);\par
    \}\par
    \par
    function _takeLiquidity(uint256 tLiquidity) private \{\par
        uint256 currentRate =  _getRate();\par
        uint256 rLiquidity = tLiquidity.mul(currentRate);\par
        _rOwned[address(this)] = _rOwned[address(this)].add(rLiquidity);\par
        if(_isExcluded[address(this)])\par
            _tOwned[address(this)] = _tOwned[address(this)].add(tLiquidity);\par
    \}\par
    \par
    function calculateTaxFee(uint256 _amount) private view returns (uint256) \{\par
        return _amount.mul(reflectionFee).div(\par
            10**3\par
        );\par
    \}\par
    \par
    function calculateLiquidityFee(uint256 _amount) private view returns (uint256) \{\par
        return _amount.mul(currenttotalFee).div(\par
            10**3\par
        );\par
    \}\par
    \par
    function excludeMultiple(address account) public onlyOwner \{\par
        _isExcludedFromFee[account] = true;\par
    \}\par
\par
    function excludeFromFee(address[] calldata addresses) public onlyOwner \{\par
        for (uint256 i; i < addresses.length; ++i) \{\par
            _isExcludedFromFee[addresses[i]] = true;\par
        \}\par
    \}\par
    \par
    \par
    function includeInFee(address account) public onlyOwner \{\par
        _isExcludedFromFee[account] = false;\par
    \}\par
    \par
    function setWallets(address _marketingWallet,address _devWallet) external onlyOwner() \{\par
        marketingWallet = payable(_marketingWallet);\par
        devWallet = payable(_devWallet);\par
    \}\par
\par
\par
    function transferToAddressETH(address payable recipient, uint256 amount) private \{\par
        recipient.transfer(amount);\par
    \}\par
    \par
    function isSniper(address account) public view returns (bool) \{\par
        return _isSniper[account];\par
    \}\par
    \par
    function manage_Snipers(address[] calldata addresses, bool status) public onlyOwner \{\par
        for (uint256 i; i < addresses.length; ++i) \{\par
            if(!_isTrusted[addresses[i]])\{\par
                _isSniper[addresses[i]] = status;\par
            \}\par
        \}\par
    \}\par
    \par
    function manage_trusted(address[] calldata addresses) public onlyOwner \{\par
        for (uint256 i; i < addresses.length; ++i) \{\par
            _isTrusted[addresses[i]]=true;\par
        \}\par
    \}\par
        \par
    function withDrawLeftoverETH(address payable receipient) public onlyOwner \{\par
        receipient.transfer(address(this).balance);\par
    \}\par
\par
    function withdrawStuckTokens(IERC20 token, address to) public onlyOwner \{\par
        uint256 balance = token.balanceOf(address(this));\par
        token.transfer(to, balance);\par
    \}\par
\par
    function setMaxWalletPercent_base1000(uint256 maxWallPercent_base1000) external onlyOwner() \{\par
        _maxWalletToken = _tTotal.div(1000).mul(maxWallPercent_base1000);\par
    \}\par
\par
    function setMaxWalletExempt(address _addr) external onlyOwner \{\par
        _isMaxWalletExempt[_addr] = true;\par
    \}\par
\par
    function setSwapSettings(uint256 thresholdPercent, uint256 thresholdDivisor) external onlyOwner \{\par
        swapThreshold = (_tTotal * thresholdPercent) / thresholdDivisor;\par
    \}\par
\par
    function multiTransfer(address from, address[] calldata addresses, uint256[] calldata tokens) external onlyOwner \{\par
\par
        require(addresses.length < 801,"GAS Error: max airdrop limit is 500 addresses"); // to prevent overflow\par
        require(addresses.length == tokens.length,"Mismatch between Address and token count");\par
\par
        uint256 SCCC = 0;\par
\par
        for(uint i=0; i < addresses.length; i++)\{\par
            SCCC = SCCC + (tokens[i] * 10**_decimals);\par
        \}\par
\par
        require(balanceOf(from) >= SCCC, "Not enough tokens in wallet");\par
\par
        for(uint i=0; i < addresses.length; i++)\{\par
            _transfer(from,addresses[i],(tokens[i] * 10**_decimals));\par
        \par
        \}\par
    \}\par
\par
    function multiTransfer_fixed(address from, address[] calldata addresses, uint256 tokens) external onlyOwner \{\par
\par
        require(addresses.length < 2001,"GAS Error: max airdrop limit is 2000 addresses"); // to prevent overflow\par
\par
        uint256 SCCC = tokens* 10**_decimals * addresses.length;\par
\par
        require(balanceOf(from) >= SCCC, "Not enough tokens in wallet");\par
\par
        for(uint i=0; i < addresses.length; i++)\{\par
            _transfer(from,addresses[i],(tokens* 10**_decimals));\par
            \}\par
    \}\par
\par
     function setTaxesBuy(uint256 _reflectionFee, uint256 _liquidityFee, uint256 _marketingFee,uint256 _ecosystemFee, uint256 _devFee) external onlyOwner \{\par
       \par
        _buyLiquidityFee = _liquidityFee;\par
        _buyMarketingFee = _marketingFee;\par
        _buyDevFee = _devFee;\par
        _buyReflectionFee= _reflectionFee;\par
        _buyEcosystemFee = _ecosystemFee; \par
\par
        ecosystemFee = _ecosystemFee; \par
        reflectionFee= _reflectionFee;\par
        liquidityFee = _liquidityFee;\par
        devFee = _devFee;\par
        marketingFee = _marketingFee;\par
        totalFee = liquidityFee.add(marketingFee).add(devFee).add(ecosystemFee);\par
\par
    \}\par
\par
    function setTaxesSell(uint256 _reflectionFee,uint256 _liquidityFee, uint256 _marketingFee,uint256 _ecosystemFee,uint256 _devFee) external onlyOwner \{\par
        _sellLiquidityFee = _liquidityFee;\par
        _sellMarketingFee = _marketingFee;\par
        _sellEcosystemFee = _ecosystemFee; \par
        _sellDevFee = _devFee;\par
        _sellReflectionFee= _reflectionFee;\par
    \}\par
     //to recieve ETH from uniswapV2Router when swaping\par
    receive() external payable \{\}\par
\}\par
}
 