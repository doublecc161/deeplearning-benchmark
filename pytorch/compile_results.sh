#!/bin/bash

echo "$0"
echo "Compiling Results for Batch Size..."
python scripts/compile_results_pytorch_bs.py --path "scripts/config" --precision "fp32" --system "single"
python scripts/compile_results_pytorch_bs.py --path "scripts/config" --precision "fp16" --system "single"

echo "Compiling Results for Throughput..."
python scripts/compile_results_pytorch_throughput.py --path "results/" --precision "fp32" --system "single"
python scripts/compile_results_pytorch_throughput.py --path "results/" --precision "fp16" --system "single"

echo "Done"