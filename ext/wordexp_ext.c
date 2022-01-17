/**
 * @file wordexp_ext.c
 * @author Sami Samhuri (sami@samhuri.net)
 * @brief Ruby wrapper for the standard Unix wordexp function, used to expand shell command lines in many useful ways.
 * @version 0.1
 * @date 2022-01-16
 *
 * @copyright Copyright (c) Sami Samhuri 2022
 *
 * Released under the terms of the MIT license: https://sjs.mit-license.org
 *
 */

#include <string.h>
#include <wordexp.h>

#include "ruby.h"
#include "ruby/encoding.h"

static VALUE ext_wordexp(VALUE self, VALUE rstring) {
    Check_Type(rstring, T_STRING);
    char *string = RSTRING_PTR(rstring);

    /* Split and expand words, showing errors and failing on undefined variables */
    wordexp_t words;
    int result = wordexp(string, &words, WRDE_SHOWERR | WRDE_UNDEF);

    /* failure */
    if (result != 0) {
        switch (result) {
        case WRDE_BADCHAR:
            return ID2SYM(rb_intern("wrde_badchar"));
        case WRDE_BADVAL:
            return ID2SYM(rb_intern("wrde_badval"));
        case WRDE_CMDSUB:
            return ID2SYM(rb_intern("wrde_cmdsub"));
        case WRDE_NOSPACE:
            return ID2SYM(rb_intern("wrde_nospace"));
        case WRDE_SYNTAX:
            return ID2SYM(rb_intern("wrde_syntax"));
        default:
            return ID2SYM(rb_intern("unknown_error"));
        }
    }

    /* success */
    VALUE rwords = rb_ary_new2(words.we_wordc);
    for (size_t i = 0; i < words.we_wordc; i++) {
        VALUE rword = rb_str_new2(words.we_wordv[i]);
        rb_ary_push(rwords, rword);
    }
    wordfree(&words);
    return rwords;
}

void Init_wordexp_ext(void) {
    VALUE Wordexp = rb_define_module("Wordexp");

    VALUE Ext = rb_define_class_under(Wordexp, "Ext", rb_cObject);
    rb_define_singleton_method(Ext, "wordexp", ext_wordexp, 1);
}
