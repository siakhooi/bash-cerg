Name:           siakhooi-cerg
Version:        0.1.0
Release:        1%{?dist}
Summary:        certificate generators for development purposes

License:        MIT
URL:            https://github.com/siakhooi/bash-cerg
Source0:        https://github.com/siakhooi/%{name}/archive/refs/tags/${version}.tar.gz
BuildArch:      noarch

Requires:       bash

%description
certificate generators for development purposes.

%install
%{__mkdir}   -v -p %{buildroot}%{_bindir}
%{__mkdir}   -v -p %{buildroot}/usr/share/licenses/siakhooi-cerg
%{__install} -v -m 0755 %{_topdir}/BUILD/usr/bin/* %{buildroot}%{_bindir}
%{__install} -v -m 644  %{_topdir}/BUILD/LICENSE %{buildroot}/usr/share/licenses/siakhooi-cerg

%files
%license LICENSE
%{_bindir}/cerg-generate-rootca

%changelog
* Sun Apr 13 2025 Siak Hooi <siakhooi@gmail.com> - 0.1.0
- initial version
