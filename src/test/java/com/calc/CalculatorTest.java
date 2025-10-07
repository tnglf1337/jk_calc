package com.calc;

import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;

public class CalculatorTest {
    @Test
    void test1() {
        Calculator c = new Calculator();
        int res = c.add(3,6);

        assertThat(res).isEqualTo(9);
    }
}
