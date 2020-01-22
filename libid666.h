#ifndef LIBID666_H
#define LIBID666_H

#include "int.h"

typedef struct id666_s id666;

struct id666_s {
    /* song title - if song[0]==0, unknown */
    char song[256];

    /* game title - if game[0]==0, unknown */
    char game[256];

    /* dumper - if dumper[0]==0, unknown */
    char dumper[256];

    /* comment - if comment[0]==0, unknown */
    char comment[256];

    /* artist - if artist[0]==0, unknown */
    char artist[256];

    /* publisher - if publisher[0]==0, unknown */
    char publisher[256];

    /* official ost name - if ost[0]==0, unknown */
    char ost[256];

    /* rip year/month/day, -1 == not found */
    int rip_year;
    int rip_month;
    int rip_day;

    /* publish year, -1 == not found */
    int year;

    /* all times given in "ticks", 1 tick == 1/64000 seconds */
    /* play length (in ticks) (computed) - can be ( intro + (loop * loops) + end) or just len */
    jpr_int32 play_len;

    /* total length (in ticks) (computed) = play_len + fade */
    jpr_int32 total_len;

    /* song length (in ticks) (from the file) */
    /* can be zero, check intro length if len == 0 */
    jpr_int32 len;

    /* fade length (in ticks) (from the file) */
    jpr_int32 fade;

    /* intro length (in ticks) (from the file) */
    /* -1 indicates not in file */
    jpr_int32 intro;

    /* loop length (in ticks) (from the file) */
    /* -1 indicates not in file */
    jpr_int32 loop;

    /* end length (in ticks) (from the file) */
    /* 0 indicates not in file (can be negative) */
    jpr_int32 end;

    /* voice(s) to mute, check bits */
    jpr_uint8 mute;

    /* number of times to loop */
    jpr_uint8 loops;

    /* if there's an official OST - disc number. */
    /* 0 = unknown */
    jpr_uint8 ost_disc;

    /* if there's an official OST - track number. */
    /* 0 = unknown */
    jpr_uint8 ost_track;

    /* emulator used to dump spc */
    jpr_uint8 emulator;

    /* mixing amplitude/gain - given as a -15.16 packed integer */
    /* default is 65536 (1 << 16) */
    jpr_uint32 amp;

    /* were the id666 tags in binary format (1) or text format (0) */
    jpr_uint8 binary;
};

#ifdef __cplusplus
extern "C" {
#endif

id666 *id666_load(jpr_uint8 *data, size_t len);
void id666_free(id666 *id6);

#ifdef __cplusplus
}
#endif

#endif
