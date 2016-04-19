/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/DiegoAlejandro/Documents/GitHub/Architecture-/Procesador_1/RegisterFile.vhd";
extern char *IEEE_P_3620187407;

unsigned char ieee_p_3620187407_sub_4042748798_3965413181(char *, char *, char *, char *, char *);
int ieee_p_3620187407_sub_514432868_3965413181(char *, char *, char *);


static void work_a_2166523021_3212880686_p_0(char *t0)
{
    char t19[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned char t8;
    unsigned int t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    int t15;
    int t16;
    unsigned int t17;
    unsigned int t18;
    int t20;
    char *t21;
    char *t22;
    char *t23;

LAB0:    xsi_set_current_line(26, ng0);
    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(34, ng0);
    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t1 = (t0 + 1032U);
    t5 = *((char **)t1);
    t1 = (t0 + 6524U);
    t15 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t5, t1);
    t16 = (t15 - 0);
    t9 = (t16 * 1);
    xsi_vhdl_check_range_of_index(0, 39, 1, t15);
    t17 = (32U * t9);
    t18 = (0 + t17);
    t6 = (t2 + t18);
    t7 = (t0 + 3776);
    t10 = (t7 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t6, 32U);
    xsi_driver_first_trans_fast_port(t7);
    xsi_set_current_line(35, ng0);
    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t1 = (t0 + 1192U);
    t5 = *((char **)t1);
    t1 = (t0 + 6540U);
    t15 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t5, t1);
    t16 = (t15 - 0);
    t9 = (t16 * 1);
    xsi_vhdl_check_range_of_index(0, 39, 1, t15);
    t17 = (32U * t9);
    t18 = (0 + t17);
    t6 = (t2 + t18);
    t7 = (t0 + 3840);
    t10 = (t7 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t6, 32U);
    xsi_driver_first_trans_fast_port(t7);
    xsi_set_current_line(36, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 6556U);
    t5 = (t0 + 8116);
    t7 = (t19 + 0U);
    t10 = (t7 + 0U);
    *((int *)t10) = 0;
    t10 = (t7 + 4U);
    *((int *)t10) = 4;
    t10 = (t7 + 8U);
    *((int *)t10) = 1;
    t15 = (4 - 0);
    t9 = (t15 * 1);
    t9 = (t9 + 1);
    t10 = (t7 + 12U);
    *((unsigned int *)t10) = t9;
    t3 = ieee_p_3620187407_sub_4042748798_3965413181(IEEE_P_3620187407, t2, t1, t5, t19);
    if (t3 != 0)
        goto LAB13;

LAB15:
LAB14:
LAB3:    t1 = (t0 + 3632);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(27, ng0);
    t1 = xsi_get_transient_memory(1280U);
    memset(t1, 0, 1280U);
    t5 = t1;
    t6 = (t0 + 7988);
    t8 = (32U != 0);
    if (t8 == 1)
        goto LAB5;

LAB6:    t10 = (t0 + 3712);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t1, 1280U);
    xsi_driver_first_trans_fast(t10);
    xsi_set_current_line(28, ng0);
    t1 = (t0 + 8020);
    t3 = (32U != 32U);
    if (t3 == 1)
        goto LAB7;

LAB8:    t5 = (t0 + 3712);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t10 = (t7 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t1, 32U);
    xsi_driver_first_trans_delta(t5, 512U, 32U, 0LL);
    xsi_set_current_line(29, ng0);
    t1 = (t0 + 8052);
    t3 = (32U != 32U);
    if (t3 == 1)
        goto LAB9;

LAB10:    t5 = (t0 + 3712);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t10 = (t7 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t1, 32U);
    xsi_driver_first_trans_delta(t5, 544U, 32U, 0LL);
    xsi_set_current_line(30, ng0);
    t1 = (t0 + 8084);
    t3 = (32U != 32U);
    if (t3 == 1)
        goto LAB11;

LAB12:    t5 = (t0 + 3712);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t10 = (t7 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t1, 32U);
    xsi_driver_first_trans_delta(t5, 576U, 32U, 0LL);
    xsi_set_current_line(31, ng0);
    t1 = xsi_get_transient_memory(32U);
    memset(t1, 0, 32U);
    t2 = t1;
    memset(t2, (unsigned char)2, 32U);
    t5 = (t0 + 3776);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t10 = (t7 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t1, 32U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(32, ng0);
    t1 = xsi_get_transient_memory(32U);
    memset(t1, 0, 32U);
    t2 = t1;
    memset(t2, (unsigned char)2, 32U);
    t5 = (t0 + 3840);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t10 = (t7 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t1, 32U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB3;

LAB5:    t9 = (1280U / 32U);
    xsi_mem_set_data(t5, t6, 32U, t9);
    goto LAB6;

LAB7:    xsi_size_not_matching(32U, 32U, 0);
    goto LAB8;

LAB9:    xsi_size_not_matching(32U, 32U, 0);
    goto LAB10;

LAB11:    xsi_size_not_matching(32U, 32U, 0);
    goto LAB12;

LAB13:    xsi_set_current_line(37, ng0);
    t10 = (t0 + 1512U);
    t11 = *((char **)t10);
    t10 = (t0 + 1352U);
    t12 = *((char **)t10);
    t10 = (t0 + 6556U);
    t16 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t12, t10);
    t20 = (t16 - 0);
    t9 = (t20 * 1);
    t17 = (32U * t9);
    t18 = (0U + t17);
    t13 = (t0 + 3712);
    t14 = (t13 + 56U);
    t21 = *((char **)t14);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    memcpy(t23, t11, 32U);
    xsi_driver_first_trans_delta(t13, t18, 32U, 0LL);
    goto LAB14;

}


extern void work_a_2166523021_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2166523021_3212880686_p_0};
	xsi_register_didat("work_a_2166523021_3212880686", "isim/procesadorMonociclo_1_tb_isim_beh.exe.sim/work/a_2166523021_3212880686.didat");
	xsi_register_executes(pe);
}
