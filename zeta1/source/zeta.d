module zeta;

import std.algorithm : min;
import std.bigint : BigInt;
import std.complex : complex, Complex, abs;
import std.functional : memoize;
import std.string : format;

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
    return memoize!(delegate BigInt(int l, int m) @safe {
        m = min(l, l - m);

        if(m == 0) {
            return BIG_INT_ONE;
        }

        return binom(l - 1, m - 1) * l / m;
    })(n, k);
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

/**
 *  ゼータ関数を計算する。
 *
 *  Params:
 *      R = 実数型
 *      s = ゼータ関数の引数
 */
Complex!R ζ(R)(Complex!R s) @safe {
    return s;
}

// 非自明な零点の虚数部の値
immutable ZEROS = [ 
    14.134725141734693790457251983562470270784257115699243175685567460149L,
    21.022039638771554992628479593896902777334340524902781754629520403587L,
    25.010857580145688763213790992562821818659549672557996672496542006745L,
    30.424876125859513210311897530584091320181560023715440180962146036993L,
    32.935061587739189690662368964074903488812715603517039009280003440784L,
    ];

/// 零点で0になること
unittest {
    foreach(t; ZEROS) {
        immutable z = ζ(complex(0x1p-1L, t));
        assert(abs(z) == 0.0L, format("abs(z) == %sでした……。", abs(z)));
    }   
}

