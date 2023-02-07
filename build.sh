xcodebuild -workspace RCSDemo.xcworkspace -scheme RCSDemo -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 14' -configuration Debug GCC_PRECOMPILE_PREFIX_HEADER=YES CLANG_ENABLE_MODULE_DEBUGGING=NO COMPILER_INDEX_STORE_ENABLE=NO OTHER_CFLAGS="-DNS_FORMAT_ARGUMENT(A)= -D_Nullable_result=_Nullable" | tee xcodebuild.log | xcpretty -r json-compilation-database -o compile_commands.json

python=`which python`

echo ${python}

chmod +x ./scan_header.py

${python} ./scan_header.py
