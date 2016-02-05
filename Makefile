TEMP_DIR=build_temp
HIVE_VERSION=1.2.1

generate-service: clean
	mkdir ${TEMP_DIR}
	git clone --branch release-${HIVE_VERSION} git@github.com:apache/hive.git ${TEMP_DIR}/hive
	thrift -r -out . --gen go ${TEMP_DIR}/hive/service/if/TCLIService.thrift

clean:
	-rm -rf ${TEMP_DIR}
