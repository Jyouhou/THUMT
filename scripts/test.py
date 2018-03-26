#! /usr/bin/env python

import os
import sys
import re
import string
import types

# root_dir = '/home/zhangjiacheng/git/THUMT_170913'
root_dir = '/home/rjq/project/THUMT_theano_ruan'
code_dir = root_dir + '/thumt'

def version():
	'''Display version.'''
	s = '----------------------------------------\n' + \
	    ' test v0.1\n' + \
		' 2017/06/19 - 2017/06/19\n' + \
		' (c) 2017 Thumt\n' + \
		'----------------------------------------\n'
	print s

def help():
	'''Display helping message.'''
	s = 'Usage: test.py [--help] ...\n' + \
	    'Required arguments:\n' + \
		'  --model-file <file>         model file(s)\n' + \
		'  --test-src-file <file>      test set, source file\n' + \
		'  --test-trg-file <file>      translation of test set\n' + \
		'  --device {cpu, gpu0, ...}   the device for running the script\n' + \
		'Optional arguments:\n' + \
		'  --test-ref-file <file>      test set, reference file(s)\n' + \
		'  --replace-unk               replacing unknown words\n' + \
		'                                0: off (default)\n' + \
		'                                1: on\n' + \
		'  --length-normalization      use length normalization\n' + \
		'                                0: off\n' + \
		'                                1: on (default)\n' + \
		'  --help                      displaying helping message\n'
	print s
	sys.exit()

if __name__ == '__main__':
	# display version
	version()
	# initialize arguments
	model_file = ''     # model file, ensemble is applied for multiple models
	test_src_file = ''  # test set, source file
	test_trg_file = ''  # translation of test set
	device = ''         # the device for running the script
	test_ref_file = ''  # test, reference file(s)
	unkreplace = 0      # replace unknown words
	length_norm = 1     # length normalization
	ensemble = True    # ensemble
	# analyze command-line arguments
	i = 1
	while i < len(sys.argv):
		if sys.argv[i] == '--model-file':
			model_file = []
			offset = 1
			while i + offset < len(sys.argv) and sys.argv[i + offset][0:2] != '--':
				model_file.append(sys.argv[i + offset])
				offset += 1
			i += len(model_file) - 1
			if len(model_file) == 1:
				model_file = model_file[0]
				ensemble = False
		elif sys.argv[i] == '--test-src-file':
			test_src_file = sys.argv[i + 1]
		elif sys.argv[i] == '--test-trg-file':
			test_trg_file = sys.argv[i + 1]
		elif sys.argv[i] == '--device':
			device = sys.argv[i + 1]
		elif sys.argv[i] == '--test-ref-file':
			test_ref_file = sys.argv[i + 1]
		elif sys.argv[i] == '--replace-unk':
			unkreplace = int(sys.argv[i + 1])
		elif sys.argv[i] == '--length-normalization':
			length_norm = int(sys.argv[i + 1])
		else:
			help()
		i += 2
	# check required arguments
	if model_file == '' or \
	   test_src_file == '' or \
	   test_trg_file == '' or \
	   device == '':
		help()
	# translate
	optional = ''
	if unkreplace == 1:
		optional += ' -unk '
	if length_norm == 1:
		optional += ' --length-norm '
	if ensemble:
		cmd = 'THEANO_FLAGS=floatX=float32,device=' + device + \
	      ' python ' + code_dir + '/translate_ensemble.py' + \
		  ' -i ' + test_src_file + \
		  ' -o ' + test_trg_file + \
		  ' -m ' + ' '.join(model_file) + optional
	else:
		cmd = 'THEANO_FLAGS=floatX=float32,device=' + device + \
	      ' python ' + code_dir + '/translate.py' + \
		  ' -i ' + test_src_file + \
		  ' -o ' + test_trg_file + \
		  ' -m ' + model_file + optional
	print cmd
	os.system(cmd)
	# evaluate
	if test_ref_file != '':
		cmd = 'perl ' + code_dir + '/multi-bleu.perl -lc ' + \
		      test_ref_file + ' < ' + test_trg_file + ' > ' + 'evalResult'
		print cmd
		os.system(cmd)
