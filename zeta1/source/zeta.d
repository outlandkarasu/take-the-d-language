module zeta;

import std.algorithm : min;
import std.bigint : BigInt;

/// BigIntの定数1
private immutable BIG_INT_ONE = BigInt(1);

/**
 *  Params:
 *      n = 2項係数の上の数字
 *      k = 2項係数の下の数字
 *  Returns:
 *      2項係数の値
 */
BigInt binom(int n, int k) @safe
in {
    assert(0 <= n);
    assert(0 <= k);
    assert(k <= n);
} body {
    k = min(n, n - k);

    if(k == 0) {
        return BIG_INT_ONE;
    }

    return binom(n - 1, k - 1) * n / k;
}

/// これがユニットテスト
unittest {
    assert(binom(0, 0) == 1);

    assert(binom(1, 0) == 1);
    assert(binom(1, 1) == 1);

    assert(binom(2, 0) == 1);
    assert(binom(2, 1) == 2);
    assert(binom(2, 2) == 1);

    assert(binom(3, 0) == 1);
    assert(binom(3, 1) == 3);
    assert(binom(3, 2) == 3);
    assert(binom(3, 3) == 1);
    assert(binom(4, 0) == 1);
    assert(binom(4, 1) == 4);
    assert(binom(4, 2) == 6);
    assert(binom(4, 3) == 4);
    assert(binom(4, 4) == 1);

    assert(binom(5, 0) == 1);
    assert(binom(5, 1) == 5);
    assert(binom(5, 2) == 10);
    assert(binom(5, 3) == 10);
    assert(binom(5, 4) == 5);
    assert(binom(5, 5) == 1);
}

