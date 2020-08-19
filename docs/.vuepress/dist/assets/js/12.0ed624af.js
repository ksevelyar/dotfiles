(window.webpackJsonp=window.webpackJsonp||[]).push([[12],{361:function(t,e,s){"use strict";s.r(e);var r=s(42),a=Object(r.a)({},(function(){var t=this,e=t.$createElement,s=t._self._c||e;return s("ContentSlotsDistributor",{attrs:{"slot-key":t.$parent.slotKey}},[s("h1",{attrs:{id:"live-usb"}},[s("a",{staticClass:"header-anchor",attrs:{href:"#live-usb"}},[t._v("#")]),t._v(" Live Usb")]),t._v(" "),s("h2",{attrs:{id:"download-it"}},[s("a",{staticClass:"header-anchor",attrs:{href:"#download-it"}},[t._v("#")]),t._v(" Download it")]),t._v(" "),s("p",[s("a",{attrs:{href:"https://drive.google.com/file/d/1XBa1LUK32A_DbMBge44co_AFfg44Ngqo/view?usp=sharing",target:"_blank",rel:"noopener noreferrer"}},[t._v("idempotent-desktop.iso"),s("OutboundLink")],1),t._v(" ~1.7GB")]),t._v(" "),s("h2",{attrs:{id:"or-generate"}},[s("a",{staticClass:"header-anchor",attrs:{href:"#or-generate"}},[t._v("#")]),t._v(" Or generate")]),t._v(" "),s("p",[t._v("Install nix with "),s("code",[t._v("curl -L https://nixos.org/nix/install | sh")]),t._v(" (for non NixOS users)")]),t._v(" "),s("p",[t._v("Clone repo: "),s("code",[t._v("git clone git@github.com:ksevelyar/idempotent-desktop.git && cd idempotent-desktop")])]),t._v(" "),s("p",[t._v("Build "),s("a",{attrs:{href:"https://github.com/ksevelyar/idempotent-desktop/blob/master/live-usb/graphical.nix",target:"_blank",rel:"noopener noreferrer"}},[t._v("live-usb.nix"),s("OutboundLink")],1)]),t._v(" "),s("div",{staticClass:"language-sh extra-class"},[s("pre",{pre:!0,attrs:{class:"language-sh"}},[s("code",[t._v("nix-build "),s("span",{pre:!0,attrs:{class:"token string"}},[t._v("'<nixpkgs/nixos>'")]),t._v(" -A config.system.build.isoImage -I nixos-config"),s("span",{pre:!0,attrs:{class:"token operator"}},[t._v("=")]),t._v("live-usb/graphical.nix\n\n")])])]),s("p",[s("a",{attrs:{href:"https://github.com/ksevelyar/idempotent-desktop/blob/master/live-usb/term.nix",target:"_blank",rel:"noopener noreferrer"}},[t._v("Or minimal version without X"),s("OutboundLink")],1),t._v(" ~700MB:")]),t._v(" "),s("div",{staticClass:"language-sh extra-class"},[s("pre",{pre:!0,attrs:{class:"language-sh"}},[s("code",[t._v("nix-build "),s("span",{pre:!0,attrs:{class:"token string"}},[t._v("'<nixpkgs/nixos>'")]),t._v(" -A config.system.build.isoImage -I nixos-config"),s("span",{pre:!0,attrs:{class:"token operator"}},[t._v("=")]),t._v("live-usb-min.nix\n")])])]),s("p",[t._v("You can generate your own iso, just add new modules and remove things you don't want")]),t._v(" "),s("h2",{attrs:{id:"write-it-to-usb"}},[s("a",{staticClass:"header-anchor",attrs:{href:"#write-it-to-usb"}},[t._v("#")]),t._v(" Write it to usb")]),t._v(" "),s("p",[s("code",[t._v("sudo dd bs=4M if=/tmp/result/iso/id-live.iso of=/dev/disk/by-label/id-live status=progress oflag=sync")])]),t._v(" "),s("p",[t._v("You can replace "),s("code",[t._v("/dev/disk/by-label/id-live")]),t._v(" with "),s("code",[t._v("/dev/sdX")]),t._v(" with proper device from "),s("code",[t._v("lsblk")]),t._v(" output.")]),t._v(" "),s("h2",{attrs:{id:"or-run-with-virt-manager"}},[s("a",{staticClass:"header-anchor",attrs:{href:"#or-run-with-virt-manager"}},[t._v("#")]),t._v(" Or run with virt-manager")]),t._v(" "),s("p",[s("img",{attrs:{src:"https://i.imgur.com/1n0SWwG.png",alt:"virt-manager"}})]),t._v(" "),s("h3",{attrs:{id:"try-your-usb-in-vm-before-reboot"}},[s("a",{staticClass:"header-anchor",attrs:{href:"#try-your-usb-in-vm-before-reboot"}},[t._v("#")]),t._v(" Try your usb in vm before reboot")]),t._v(" "),s("div",{staticClass:"language-fish extra-class"},[s("pre",{pre:!0,attrs:{class:"language-text"}},[s("code",[t._v("sudo qemu-kvm -hdb /dev/sdc\n")])])])])}),[],!1,null,null,null);e.default=a.exports}}]);