FROM alpine as builder
LABEL maintainer="calganaygun@hacettepe.edu.tr"

# Install required programs for building dump1090.
RUN apk add g++ make git libusb-dev librtlsdr-dev ca-certificates cmake

# Add DVB drivers to blacklist.
RUN echo 'blacklist dvb_usb_rtl28xxu' > /etc/modprobe.d/rtlsdr.conf && \
    apk add rtl-sdr

WORKDIR /tmp

# Clone official dump1090 repository and build dump1090.
RUN git clone git://github.com/antirez/dump1090.git && \
    cd dump1090 && \
    make

WORKDIR /tmp/dump1090


FROM alpine

WORKDIR /app/dump1090

# In new alpine image install rtl-sdr and copy dump1090 binary.
RUN apk add rtl-sdr
COPY --from=builder /tmp/dump1090/dump1090 .

ENTRYPOINT ["./dump1090"]