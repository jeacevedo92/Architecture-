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

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/mauricio/Escritorio/procesador2.0/procesador2/SignExtensionUnit.vhd";



static void work_a_4169188674_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned char t11;
    unsigned char t12;
    char *t13;
    char *t14;
    char *t15;

LAB0:    xsi_set_current_line(15, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 2744);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 13U);
    xsi_driver_first_trans_delta(t1, 19U, 13U, 0LL);
    xsi_set_current_line(16, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t7 = (12 - 12);
    t8 = (t7 * -1);
    t9 = (1U * t8);
    t10 = (0 + t9);
    t1 = (t2 + t10);
    t11 = *((unsigned char *)t1);
    t12 = (t11 == (unsigned char)3);
    if (t12 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(19, ng0);
    t1 = xsi_get_transient_memory(19U);
    memset(t1, 0, 19U);
    t2 = t1;
    memset(t2, (unsigned char)2, 19U);
    t3 = (t0 + 2744);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t13 = *((char **)t6);
    memcpy(t13, t1, 19U);
    xsi_driver_first_trans_delta(t3, 0U, 19U, 0LL);

LAB3:    t1 = (t0 + 2664);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(17, ng0);
    t3 = xsi_get_transient_memory(19U);
    memset(t3, 0, 19U);
    t4 = t3;
    memset(t4, (unsigned char)3, 19U);
    t5 = (t0 + 2744);
    t6 = (t5 + 56U);
    t13 = *((char **)t6);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t3, 19U);
    xsi_driver_first_trans_delta(t5, 0U, 19U, 0LL);
    goto LAB3;

}


extern void work_a_4169188674_3212880686_init()
{
	static char *pe[] = {(void *)work_a_4169188674_3212880686_p_0};
	xsi_register_didat("work_a_4169188674_3212880686", "isim/procesador2_tb_isim_beh.exe.sim/work/a_4169188674_3212880686.didat");
	xsi_register_executes(pe);
}
