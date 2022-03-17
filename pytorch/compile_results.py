
import scripts.compile_results_pytorch_throughput
import scripts.compile_results_pytorch_bs

print("Compiling Results for Batch Size...")
scripts.compile_results_pytorch_bs.main('--path scripts/config --precision fp16 --system single'.split())
scripts.compile_results_pytorch_bs.main('--path scripts/config --precision fp32 --system single'.split())

print("Compiling Results for Throughput...")
scripts.compile_results_pytorch_throughput.main('--path results/ --precision fp16 --system single'.split())
scripts.compile_results_pytorch_throughput.main('--path results/ --precision fp32 --system single'.split())

print("\nDone.")
