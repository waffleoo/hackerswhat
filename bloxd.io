// ==UserScript==
// @name         Melon Hub (bloxd.io)
// @namespace    https://github.com/OfficiallyMelon/Melon-Hub
// @version      2025-01-31
// @description  like steroids for bloxd.io (shit release, minimum features, no themes/settings yet.)
// @author       melon
// @match        https://bloxd.io*
// @icon         https://bloxd.io*
// @grant        GM_getValue
// @grant        GM_setValue
// @grant        unsafeWindow
// @run-at       document-start
// ==/UserScript==

(() => {
        "use strict";
        var e = {
                d: (t, n) => {
                        for (var o in n) e.o(n, o) && !e
                                .o(t, o) && Object
                                .defineProperty(t, o, {
                                        enumerable:
                                                !
                                                0,
                                        get: n[o]
                                })
                },
                o: (e, t) => Object.prototype.hasOwnProperty
                        .call(e, t)
        };
        e.d({}, {
                n9: () => C,
                oP: () => I
        });
        var t, n, o, i = {
                coordinates: [null, null, null],
                methods: {},
                CurrentlyInjected: !1,
                freecamPosition: [0, 0, 0]
        };
        n = function () {
                for (var e = [], t = 0; t < arguments
                        .length; t++) e[t] = arguments[t];
                var n = !1;
                try {
                        void 0 !== e[2].swingDuration && (n = !
                                0)
                }
                catch (e) {}
                var o = !1;
                try {
                        void 0 !== e[1].__id && (o = !0)
                }
                catch (e) {}
                n && o && 4 === e.length && 200 === e[2]
                        .swingDuration && 1 === e[1].__id && (i
                                .hookedObject = e[0],
                                setTimeout((function () {
                                        i.babylonEngine =
                                                window
                                                .BABYLON,
                                                i
                                                .noaInstance =
                                                i
                                                .hookedObject
                                                .heldItem
                                                .noa,
                                                i
                                                .CurrentlyInjected = !
                                                0,
                                                C("Injection State:",
                                                        i
                                                        .noaInstance ?
                                                        "Successfully hooked noa!" :
                                                        "Unsuccessful, try reloading the page."
                                                        ),
                                                console
                                                .log("Successfully hooked noa!",
                                                        i
                                                        .noaInstance
                                                        ),
                                                window
                                                .noa =
                                                i
                                                .noaInstance,
                                                i
                                                .genericPlayerState =
                                                i
                                                .noaInstance
                                                .ents
                                                ._storage
                                                .genericLifeForm
                                                .hash[i.noaInstance
                                                        .playerEntity
                                                        ],
                                                setTimeout(
                                                        (function () {
                                                                I.style.cssText =
                                                                        "position:absolute;bottom:5px;right:5px;width:15px;height:15px;background:green;border-radius:50%;"
                                                        }),
                                                        100
                                                        )
                                }), 1))
        }, o = (t = Object)["assign"], t.assign = new Proxy(o, {
                apply: function (e, t, o) {
                        return n.apply(void 0,
                                        o),
                                Reflect.apply(e,
                                        t, o)
                }
        });
        var a = null,
                r = null;
        var s = function () {
                        function e() {}
                        return e.prototype.simulateLeftClick =
                                function (e) {
                                        var t = new MouseEvent(
                                                "mousedown", {
                                                        button: 0,
                                                        bubbles: !
                                                                0,
                                                        cancelable:
                                                                !
                                                                0
                                                });
                                        e.dispatchEvent(t);
                                        var n = new MouseEvent(
                                                "mouseup", {
                                                        button: 0,
                                                        bubbles: !
                                                                0,
                                                        cancelable:
                                                                !
                                                                0
                                                });
                                        e.dispatchEvent(n)
                                }, e.prototype.simulateRightClick =
                                function (e) {
                                        var t = new MouseEvent(
                                                "mousedown", {
                                                        button: 2,
                                                        bubbles: !
                                                                0,
                                                        cancelable:
                                                                !
                                                                0
                                                });
                                        e.dispatchEvent(t);
                                        var n = new MouseEvent(
                                                "mouseup", {
                                                        button: 2,
                                                        bubbles: !
                                                                0,
                                                        cancelable:
                                                                !
                                                                0
                                                });
                                        e.dispatchEvent(n)
                                }, e.prototype.distanceBetween =
                                function (e, t) {
                                        var n = t[0] - e[0],
                                                o = t[1] - e[1],
                                                i = t[2] - e[2];
                                        return n * n + o * o + i * i
                                }, e.prototype.distanceBetweenSqrt =
                                function (e, t) {
                                        return Math.sqrt(this
                                                .distanceBetween(
                                                        e, t))
                                }, e.prototype.ChangeCrouchSpeed =
                                function (e) {
                                        i.noaInstance.serverSettings
                                                .crouchingSpeed = e
                                }, e.prototype.ChangeWalkSpeed =
                                function (e) {
                                        i.noaInstance.serverSettings
                                                .walkingSpeed = e
                                }, e.prototype.InstantRespawn =
                                function () {
                                        var e;
                                        i.noaInstance && (i.noaInstance
                                                .serverSettings
                                                .secsToRespawn =
                                                0, null === (e =
                                                        document
                                                        .querySelector(
                                                                ".NewButton.BlueButton.RespawnButton"
                                                                )
                                                        ) ||
                                                void 0 === e ||
                                                e.click())
                                }, e.prototype.normalizeVector =
                                function (e) {
                                        var t = e[0] * e[0] + e[1] * e[
                                                1] + e[2] * e[2];
                                        if (t > 0) {
                                                var n = 1 / Math.sqrt(
                                                t);
                                                return [e[0] * n, e[1] *
                                                        n, e[
                                                        2] * n
                                                ]
                                        }
                                        return e
                                }, e.prototype.killaura = function (e) {
                                        var t = function () {
                                                        var e = i
                                                                .noaInstance,
                                                                t = e
                                                                .playerNames,
                                                                n = e
                                                                .playerEntity,
                                                                o = e
                                                                .ents,
                                                                a = [];
                                                        for (var r in t)
                                                                if (t.hasOwnProperty(
                                                                                r
                                                                                )) {
                                                                        var s = Number(
                                                                                r);
                                                                        s !== n &&
                                                                                o
                                                                                .hasComponent(
                                                                                        s,
                                                                                        "position"
                                                                                        ) &&
                                                                                o
                                                                                .hasComponent(
                                                                                        s,
                                                                                        "genericLifeformState"
                                                                                        ) &&
                                                                                o
                                                                                .genericLifeformState(
                                                                                        s
                                                                                        )
                                                                                .isAlive &&
                                                                                a
                                                                                .push(
                                                                                        s)
                                                                } return a
                                                }()
                                                .filter((function (e) {
                                                        var
                                                        t;
                                                        return null ===
                                                                (t = i.noaInstance
                                                                        .otherPlayerSettings[
                                                                                i
                                                                                .noaInstance
                                                                                .playerEntity
                                                                                ]
                                                                        [
                                                                                e]
                                                                        ) ||
                                                                void 0 ===
                                                                t ?
                                                                void 0 :
                                                                t
                                                                .canAttack
                                                }));
                                        if (0 !== t.length) {
                                                var n = function (e) {
                                                                for (var t = i.noaInstance
                                                                                .ents
                                                                                .getPosition(
                                                                                        i
                                                                                        .noaInstance
                                                                                        .playerEntity
                                                                                        ),
                                                                                n =
                                                                                void 0,
                                                                                o =
                                                                                1 /
                                                                                0,
                                                                                a =
                                                                                0,
                                                                                r =
                                                                                e; a <
                                                                        r
                                                                        .length; a++
                                                                        ) {
                                                                        var s = r[
                                                                                        a],
                                                                                l =
                                                                                c
                                                                                .distanceBetween(
                                                                                        t,
                                                                                        i
                                                                                        .noaInstance
                                                                                        .ents
                                                                                        .getPosition(
                                                                                                s
                                                                                                )
                                                                                        );
                                                                        (void 0 ===
                                                                                n ||
                                                                                l <
                                                                                o
                                                                                ) &&
                                                                        (n = s, o =
                                                                                l
                                                                                )
                                                                }
                                                                return n
                                                        }(t),
                                                        o = i
                                                        .noaInstance
                                                        .ents
                                                        .getPosition(i
                                                                .noaInstance
                                                                .playerEntity
                                                                ),
                                                        a = i
                                                        .noaInstance
                                                        .ents
                                                        .getPositionData(
                                                                n)
                                                        .position;
                                                if (c.distanceBetweenSqrt(
                                                                o, a) <=
                                                        5) {
                                                        var r = i
                                                                .noaInstance
                                                                .camera
                                                                ._dirVector;
                                                        i.noaInstance
                                                                .camera
                                                                ._dirVector =
                                                                c
                                                                .normalizeVector(
                                                                        [a[0] - o[
                                                                                        0],
                                                                                a[
                                                                                        1] -
                                                                                o[
                                                                                        1],
                                                                                a[
                                                                                        2] -
                                                                                o[
                                                                                        2]
                                                                        ]
                                                                        );
                                                        var s = document
                                                                .querySelector(
                                                                        "#noa-canvas"
                                                                        );
                                                        s && this
                                                                .simulateLeftClick(
                                                                        s
                                                                        ),
                                                                i
                                                                .noaInstance
                                                                .camera
                                                                ._dirVector =
                                                                r
                                                }
                                        }
                                        else C("No targets found")
                                }, e.prototype.removeAllCookies =
                                function () {
                                        for (var e = 0, t = document
                                                        .cookie.split(
                                                                ";"
                                                                ); e < t
                                                .length; e++) {
                                                var n = t[e],
                                                        o = n.indexOf(
                                                                "="),
                                                        i = o > -1 ? n
                                                        .substr(0, o) :
                                                        n;
                                                document.cookie = i +
                                                        "=;expires=Thu, 01 Jan 1970 00:00:00 GMT;path=/"
                                        }
                                }, e
                }(),
                l = !1,
                c = new s,
                u = [{
                        type: "Combat",
                        title: "Kill Aura",
                        desc: "Detects and attacks nearby entities (BROKEN)",
                        pertick: function (e) {
                                e && c.killaura(30)
                        }
                }, {
                        type: "Combat",
                        title: "Auto Clicker",
                        desc: "Automatically clicks for you",
                        pertick: function () {
                                if (i.CurrentlyInjected &&
                                        i.noaInstance) {
                                        var e = document
                                                .querySelector(
                                                        "#noa-canvas"
                                                        );
                                        e && (e.dispatchEvent(new MouseEvent(
                                                        "mousedown", {
                                                                button: 0,
                                                                bubbles: !
                                                                        0,
                                                                cancelable:
                                                                        !
                                                                        0
                                                        }
                                                        )),
                                                e
                                                .dispatchEvent(
                                                        new MouseEvent(
                                                                "mouseup", {
                                                                        button: 0,
                                                                        bubbles: !
                                                                                0,
                                                                        cancelable:
                                                                                !
                                                                                0
                                                                }
                                                                )
                                                        )
                                                )
                                }
                        }
                }, {
                        type: "Combat",
                        title: "Anti Shake",
                        desc: "Disables camera shake on hit",
                        pertick: function (e) {
                                e && i.CurrentlyInjected &&
                                        i.noaInstance &&
                                        (i.noaInstance
                                                .entities
                                                .getState(
                                                        i
                                                        .noaInstance
                                                        .playerEntity,
                                                        "cameraShake"
                                                        )
                                                .shakePower =
                                                0)
                        }
                }, {
                        type: "Player",
                        title: "Scaffold",
                        desc: "Automatically places blocks under you. (BROKEN)",
                        pertick: function (e) {
                                if (e && i
                                        .CurrentlyInjected &&
                                        i.noaInstance) {
                                        var t = i
                                                .noaInstance
                                                .playerEntity,
                                                n = i
                                                .noaInstance
                                                .ents
                                                .getPosition(
                                                        t
                                                        ),
                                                o = i
                                                .noaInstance
                                                .getBlock(
                                                        n[
                                                                0],
                                                        n[
                                                                1] -
                                                        1,
                                                        n[
                                                                2]
                                                        ),
                                                s = i
                                                .noaInstance
                                                .ents
                                                .getInventoryState(
                                                        i
                                                        .noaInstance
                                                        .playerEntity
                                                        )
                                                .selectedItem,
                                                l = !
                                                s ||
                                                "CubeBlock" !==
                                                s
                                                .typeObj
                                                .type &&
                                                "TwoDBlock" !==
                                                s
                                                .typeObj
                                                .type &&
                                                "SlabBlock" !==
                                                s
                                                .typeObj
                                                .type ?
                                                null : s
                                                .typeObj
                                                .id;
                                        if (0 === o) {
                                                var c = [Math.floor(n[
                                                                0]),
                                                        Math
                                                        .floor(n[
                                                                        1] -
                                                                1
                                                                ),
                                                        Math
                                                        .floor(n[
                                                                2])
                                                ];
                                                C("Placing block at",
                                                                c
                                                                .toString()
                                                                ),
                                                        C("Block ID",
                                                                o
                                                                ),
                                                        l &&
                                                        (u = {
                                                                        pos: c,
                                                                        toBlock: l,
                                                                        checker: ""
                                                                },
                                                                a &&
                                                                r ?
                                                                a
                                                                .apply(r,
                                                                        [114,
                                                                                u]
                                                                        ) :
                                                                console
                                                                .error(
                                                                        "[HOOK ERROR] hookedSend is null"),
                                                                i
                                                                .noaInstance
                                                                .setBlock(
                                                                        c[
                                                                                0],
                                                                        c[
                                                                                1],
                                                                        c[
                                                                                2],
                                                                        l
                                                                        )
                                                                )
                                        }
                                }
                                var u
                        }
                }, {
                        type: "Player",
                        title: "Instant Respawn",
                        desc: "Instantly respawns you when you die.",
                        pertick: function () {
                                i.CurrentlyInjected && i
                                        .noaInstance &&
                                        c
                                        .InstantRespawn()
                        }
                }, {
                        type: "Combat",
                        title: "Auto Trigger",
                        desc: "Auto trigger for Aimbot (BROKEN)",
                        pertick: function (e) {
                                if (e && l) {
                                        var t = document
                                                .querySelector(
                                                        "#noa-canvas"
                                                        );
                                        t && (t.dispatchEvent(new MouseEvent(
                                                        "mousedown", {
                                                                button: 0,
                                                                bubbles: !
                                                                        0,
                                                                cancelable:
                                                                        !
                                                                        0
                                                        }
                                                        )),
                                                t
                                                .dispatchEvent(
                                                        new MouseEvent(
                                                                "mouseup", {
                                                                        button: 0,
                                                                        bubbles: !
                                                                                0,
                                                                        cancelable:
                                                                                !
                                                                                0
                                                                }
                                                                )
                                                        )
                                                )
                                }
                        }
                }, {
                        type: "Player",
                        title: "Account Gen",
                        desc: "Generates accounts for you to use. (Requires Refresh)",
                        pertick: function () {
                                c.removeAllCookies(),
                                        location
                                        .reload()
                        }
                }, {
                        type: "Combat",
                        title: "Aimbot",
                        desc: "Automatically aims at the nearest player.",
                        pertick: function (e) {
                                if (e) {
                                        var t = null,
                                                n = 1 /
                                                0;
                                        if (i.noaInstance
                                                .entities
                                                ._storage
                                                .position
                                                .list
                                                .forEach(
                                                        (function (
                                                                e) {
                                                                if ("number" !=
                                                                        typeof e
                                                                        .__id &&
                                                                        1 !=
                                                                        e
                                                                        .__id &&
                                                                        e
                                                                        .__id !==
                                                                        i
                                                                        .noaInstance
                                                                        .serverPlayerEntity
                                                                        ) {
                                                                        console.log(e
                                                                                .__id);
                                                                        var o = i
                                                                                .noaInstance
                                                                                .entities
                                                                                .getGenericLifeformState(
                                                                                        e
                                                                                        .__id
                                                                                        );
                                                                        if (o && o
                                                                                .isAlive
                                                                                ) {
                                                                                var a = i
                                                                                        .noaInstance
                                                                                        .entities
                                                                                        .getPosition(
                                                                                                1
                                                                                                ),
                                                                                        r =
                                                                                        e
                                                                                        .position,
                                                                                        s = {
                                                                                                x: a[0],
                                                                                                y: a[1],
                                                                                                z: a[2]
                                                                                        },
                                                                                        l = {
                                                                                                x: r[0],
                                                                                                y: r[1],
                                                                                                z: r[2]
                                                                                        };
                                                                                if (a[0] ===
                                                                                        r[
                                                                                                0] &&
                                                                                        a[
                                                                                                1] ===
                                                                                        r[
                                                                                                1] &&
                                                                                        a[
                                                                                                2] ===
                                                                                        r[
                                                                                                2]
                                                                                        )
                                                                                        return;
                                                                                var c = (d = (p =
                                                                                                l)
                                                                                        .x -
                                                                                        (u =
                                                                                                s)
                                                                                        .x,
                                                                                        f =
                                                                                        p
                                                                                        .y -
                                                                                        u
                                                                                        .y,
                                                                                        m =
                                                                                        p
                                                                                        .z -
                                                                                        u
                                                                                        .z,
                                                                                        Math
                                                                                        .sqrt(Math
                                                                                                .pow(d,
                                                                                                        2) +
                                                                                                Math
                                                                                                .pow(f,
                                                                                                        2) +
                                                                                                Math
                                                                                                .pow(m,
                                                                                                        2)
                                                                                                )
                                                                                        );
                                                                                c < n && (n = c, t =
                                                                                        r
                                                                                        )
                                                                        }
                                                                }
                                                                var u, p,
                                                                        d,
                                                                        f,
                                                                        m
                                                        })
                                                        ),
                                                t &&
                                                n <= 20
                                                ) {
                                                var o = i
                                                        .noaInstance
                                                        .entities
                                                        .getPosition(
                                                                1
                                                                );
                                                a = (c = [t[0] - o[0], t[
                                                                                1] -
                                                                        o[
                                                                                1],
                                                                        t[
                                                                                2] -
                                                                        o[
                                                                                2]
                                                                ],
                                                                0 ===
                                                                (u = Math
                                                                        .sqrt(Math
                                                                                .pow(c[0],
                                                                                        2
                                                                                        ) +
                                                                                Math
                                                                                .pow(c[1],
                                                                                        2
                                                                                        ) +
                                                                                Math
                                                                                .pow(c[2],
                                                                                        2
                                                                                        )
                                                                                )
                                                                        ) ?
                                                                [0, 0,
                                                                        0] :
                                                                c
                                                                .map((function (e) {
                                                                        return e /
                                                                                u
                                                                }))
                                                                ),
                                                        r =
                                                        Math
                                                        .atan2(a[
                                                                        0],
                                                                a[
                                                                        2]
                                                                ),
                                                        s =
                                                        Math
                                                        .asin(-a[
                                                                1]),
                                                        i
                                                        .noaInstance
                                                        .camera
                                                        .heading =
                                                        r,
                                                        i
                                                        .noaInstance
                                                        .camera
                                                        .pitch =
                                                        s
                                        }
                                        l = !0
                                }
                                var a, r, s, c, u;
                                l = !1
                        }
                }, {
                        type: "Movement",
                        title: "Auto Sprint",
                        desc: "Automatically sprints when moving.",
                        pertick: function () {
                                i.CurrentlyInjected && i
                                        .noaInstance &&
                                        c
                                        .ChangeWalkSpeed(
                                                i
                                                .noaInstance
                                                .serverSettings
                                                .runningSpeed
                                                )
                        }
                }, {
                        type: "Movement",
                        title: "Fast Crouch",
                        desc: "Increase crouching speed.",
                        pertick: function (e) {
                                e ? i.CurrentlyInjected &&
                                        i.noaInstance &&
                                        c
                                        .ChangeCrouchSpeed(
                                                i
                                                .noaInstance
                                                .serverSettings
                                                .runningSpeed
                                                ) : i
                                        .CurrentlyInjected &&
                                        i.noaInstance &&
                                        c
                                        .ChangeCrouchSpeed(
                                                2)
                        }
                }, {
                        type: "Movement",
                        title: "Auto Speed",
                        desc: "Increase walking speed.",
                        pertick: function (e) {
                                e ? i.CurrentlyInjected &&
                                        i.noaInstance &&
                                        c
                                        .ChangeWalkSpeed(
                                                7.4) : i
                                        .CurrentlyInjected &&
                                        i.noaInstance &&
                                        c
                                        .ChangeWalkSpeed(
                                                4.5)
                        }
                }, {
                        type: "Movement",
                        title: "Infinite Jump",
                        desc: "Jump infinitely. (only works going up blocks)",
                        pertick: function (e) {
                                e ? i.CurrentlyInjected &&
                                        i.noaInstance &&
                                        (i.noaInstance
                                                .serverSettings
                                                .airJumpCount =
                                                1 / 0) :
                                        i
                                        .CurrentlyInjected &&
                                        i.noaInstance &&
                                        (i.noaInstance
                                                .serverSettings
                                                .airJumpCount =
                                                0)
                        }
                }, {
                        type: "Exploit",
                        title: "Spider (VERY EXPERIMENTAL)",
                        desc: "Climb walls.",
                        pertick: function (e) {
                                if (e && i
                                        .CurrentlyInjected &&
                                        i.noaInstance) {
                                        var t = i
                                                .noaInstance,
                                                n = t
                                                .playerEntity,
                                                o = t
                                                .ents
                                                .getPosition(
                                                        n
                                                        ),
                                                a = o[
                                                0],
                                                r = o[
                                                1],
                                                s = o[
                                                2];
                                        0 !== t.getBlock(
                                                        a,
                                                        r,
                                                        s +
                                                        1
                                                        ) &&
                                                t.ents
                                                .getPhysicsBody(
                                                        n
                                                        )
                                                .applyImpulse(
                                                        [0, .08 *
                                                                t
                                                                .serverSettings
                                                                .jumpAmount,
                                                                0
                                                        ]
                                                        )
                                }
                        }
                }, {
                        type: "Settings",
                        title: "Soon",
                        desc: "Coming soon",
                        pertick: function () {}
                }],
                p = function () {
                        function e() {}
                        return e.saveBoolean = function (e, t, n) {
                                void 0 === n && (n = !0), (n ||
                                                null ===
                                                localStorage
                                                .getItem(e)) &&
                                        localStorage.setItem(e,
                                                JSON.stringify(
                                                        t))
                        }, e.importBoolean = function (e) {
                                var t = localStorage.getItem(e);
                                return !!t && JSON.parse(t)
                        }, e.saveString = function (e, t) {
                                localStorage.setItem(e, t)
                        }, e.importString = function (e) {
                                return localStorage.getItem(e)
                        }, e.saveObject = function (e, t) {
                                localStorage.setItem(e, JSON
                                        .stringify(t))
                        }, e.importObject = function (e) {
                                var t = localStorage.getItem(e);
                                return t ? JSON.parse(t) : null
                        }, e
                }(),
                d = document.createElement("link");
        d.rel = "stylesheet", d.href =
                "https://fonts.googleapis.com/css2?family=Gabarito:wght@400;500&display=swap";
        var f = document.createElement("div");
        f.style.cssText =
                "position:fixed;top:10px;right:10px;width:697.5px;height:448.5px;background-color:transparent;border-radius:10px;overflow:hidden;z-index:2147483646";
        var m = document.createElement("img");
        m.src = "https://github.com/OfficiallyMelon/Melon-Hub/blob/main/Assets/bloxd.io/RightMelon.png?raw=true",
                m.style.cssText = "width:697.5px;height:448.5px", m
                .style.position = "relative";
        var g = document.createElement("img");
        g.src = "https://github.com/OfficiallyMelon/Melon-Hub/blob/main/Assets/bloxd.io/LeftMelon.png?raw=true",
                g.style.cssText =
                "position:fixed;top:10px;right:495px;width:217.5px;height:448.5px;z-index:2147483646";
        var h = document.createElement("div");
        h.innerText = "Melon Hub", h.style.cssText =
                "position:absolute; top: 20px; left: 34px; font-family: Inter, sans-serif; font-size: 22px; font-weight: 500; color: white; z-index: 2147483647;";
        var b = document.createElement("div");
        b.innerText = "1.0", b.style.cssText =
                "position:absolute; top: 20px; left: 145px; font-family: Inter, sans-serif; font-size: 14px; font-weight: 300; color: white; z-index: 2147483647;";
        var y = document.createElement("div");
        y.style.cssText =
                "position:absolute;top:60px;left:-25px;width:217.5px;height:448.5px;z-index:2147483651;";
        var x = document.createElement("div");
        x.id = "rightButtonContainer", x.style.cssText =
                "position: absolute; top: 50px; right: 10px; width: 470px; height: 380px; z-index: 2147483649; overflow-y: auto; overflow-x: hidden; padding-right: 10px; box-sizing: border-box;";
        var v = document.createElement("div");
        v.id = "miniConsole", v.style.cssText =
                "position: absolute; top: 40px; right: 5px; width: 470px; height: 380px; background-color: black; color: green; overflow-y: auto; padding: 10px; box-sizing: border-box; font-family: monospace; font-size: 14px; border: 2px solid gray; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); display: none; z-index: 20000000000;";
        var w, I = document.createElement("div");
        I.id = "injectionStatus", I.style.cssText =
                "position:absolute;bottom:5px;right:5px;width:15px;height:15px;background:red;border-radius:50%;",
                document.head.appendChild(d), f.appendChild(m), f
                .appendChild(g), f.appendChild(h), f.appendChild(b), f
                .appendChild(y), f.appendChild(x), f.appendChild(v), f
                .appendChild(I), document.body.appendChild(f), w =
                Object.defineProperty, Object.defineProperty =
                function (e, t, n) {
                        try {
                                "send" === t && "function" == typeof n
                                        .value && (console.log(
                                                        "[HOOK] Defining property: send"
                                                        ), a = n.value,
                                                n.value = function () {
                                                        for (var e = [], t =
                                                                        0; t <
                                                                arguments
                                                                .length; t++
                                                                ) e[t] =
                                                                arguments[
                                                                        t
                                                                        ];
                                                        if (a) return r =
                                                                this,
                                                                a
                                                                .apply(this,
                                                                        e
                                                                        );
                                                        console.error(
                                                                "[HOOK ERROR] hookedSend is null")
                                                })
                        }
                        catch (e) {
                                console.error("[HOOK ERROR] Failed to hook send:",
                                        e)
                        }
                        return w.apply(this, arguments)
                }, Object.defineProperty(window, "getHookedSend", {
                        value: function () {
                                return a
                        },
                        writable: !1,
                        configurable: !1
                });
        var k = [];

        function C() {
                for (var e = [], t = 0; t < arguments.length; t++) e[
                        t] = arguments[t];
                var n = e.join(" "),
                        o = document.createElement("div");
                o.textContent = "> ".concat(n), o.style.color = "green",
                        o.style.marginBottom = "5px", v.appendChild(o),
                        v.scrollTop = v.scrollHeight, k.push({
                                text: n,
                                type: "output"
                        })
        }
        var M = !1,
                E = 0,
                S = 0;
        f.addEventListener("mousedown", (function (e) {
                M = !0, E = e.clientX - f
                        .getBoundingClientRect()
                        .left, S = e.clientY - f
                        .getBoundingClientRect()
                        .top, f.style.cursor =
                        "grabbing"
        })), document.addEventListener("mousemove", (function (
                e) {
                if (M) {
                        var t = "".concat(e
                                        .clientX -
                                        E, "px"
                                        ),
                                n = "".concat(e
                                        .clientY -
                                        S, "px"
                                        );
                        f.style.left = t, f
                                .style.top = n,
                                g.style.left =
                                "".concat(e
                                        .clientX -
                                        E, "px"
                                        ), g
                                .style.top = ""
                                .concat(e
                                        .clientY -
                                        S, "px")
                }
        })), document.addEventListener("mouseup", (function () {
                M = !1, f.style.cursor =
                        "default"
        }));
        var T = {};

        function O(e) {
                void 0 === e && (e = ""), console.log("active" + e);
                var t = document.getElementById("rightButtonContainer");
                if (t) {
                        for (; t.firstChild;) t.removeChild(t
                                .firstChild);
                        v.style.display = "Debug" === e ? "block" :
                                "none", "Themes" === e && B.forEach((
                                        function (e) {
                                                t.appendChild(function (t,
                                                                n,
                                                                o
                                                                ) {
                                                                var i = document
                                                                        .createElement(
                                                                                "div"
                                                                                );
                                                                i.style.cssText =
                                                                        "\n  position:relative;width:450px;height:75px;margin-bottom:10px;border-radius: 10px; right: -5px;\n  transition:transform 0.2s;cursor:pointer;\n  background:url('https://raw.githubusercontent.com/OfficiallyMelon/files-cdn/refs/heads/main/bloxd-ui/ButtonHolder.png') no-repeat center/cover;\n  transform-origin: top;\n",
                                                                        i
                                                                        .onmouseenter =
                                                                        function () {
                                                                                return i.style
                                                                                        .transform =
                                                                                        "scaleY(1.05)"
                                                                        },
                                                                        i
                                                                        .onmouseleave =
                                                                        function () {
                                                                                return i.style
                                                                                        .transform =
                                                                                        "scaleY(1)"
                                                                        };
                                                                var a = document
                                                                        .createElement(
                                                                                "div"
                                                                                );
                                                                a.style.cssText =
                                                                        "position:absolute;top:5px;left:5px;display:flex;align-items:center;",
                                                                        i
                                                                        .appendChild(
                                                                                a
                                                                                );
                                                                var r = document
                                                                        .createElement(
                                                                                "div"
                                                                                );
                                                                r.innerText =
                                                                        t,
                                                                        r
                                                                        .style
                                                                        .cssText =
                                                                        "font-family:Gabarito,sans-serif;font-size:16px;font-weight:500;color:white;",
                                                                        a
                                                                        .appendChild(
                                                                                r
                                                                                );
                                                                var s = document
                                                                        .createElement(
                                                                                "div"
                                                                                );
                                                                s.innerText =
                                                                        "(Theme)",
                                                                        s
                                                                        .style
                                                                        .cssText =
                                                                        "margin-left:5px;font-family:Gabarito,sans-serif;font-size:13px;font-weight:400;color:rgba(255, 255, 255, 0.56);",
                                                                        a
                                                                        .appendChild(
                                                                                s
                                                                                );
                                                                var l = document
                                                                        .createElement(
                                                                                "div"
                                                                                );
                                                                return l.innerText =
                                                                        o,
                                                                        l
                                                                        .style
                                                                        .cssText =
                                                                        "position:absolute;top:50px;left:5px;font-family:Gabarito,sans-serif;font-size:14px;font-weight:400;color:rgba(255, 255, 255, 0.71);",
                                                                        i
                                                                        .appendChild(
                                                                                l
                                                                                ),
                                                                        t in
                                                                        T ||
                                                                        (T[t] = !
                                                                                1
                                                                                ),
                                                                        i
                                                                        .onclick =
                                                                        function () {
                                                                                T[t] = !T[
                                                                                                t],
                                                                                        p
                                                                                        .saveObject(
                                                                                                "buttonStates",
                                                                                                T
                                                                                                ),
                                                                                        C("Theme",
                                                                                                e
                                                                                                .name,
                                                                                                "is now active."
                                                                                                ),
                                                                                        g
                                                                                        .src =
                                                                                        e
                                                                                        .LeftImage,
                                                                                        m
                                                                                        .src =
                                                                                        e
                                                                                        .RightImage,
                                                                                        p
                                                                                        .saveString(
                                                                                                "activeTheme",
                                                                                                e
                                                                                                .name
                                                                                                )
                                                                        },
                                                                        i
                                                        }
                                                        (e.name, 0,
                                                                e
                                                                .desc
                                                                )
                                                        )
                                        })), "Settings" === e &&
                                function (e, t, n, o) {
                                        var i = document.createElement(
                                                "div");
                                        i.style.cssText =
                                                "\n  position:relative;width:450px;height:100px;margin-bottom:10px;border-radius: 10px; right: -5px;\n  transition:transform 0.2s;cursor:pointer;\n  background:url('https://raw.githubusercontent.com/OfficiallyMelon/files-cdn/refs/heads/main/bloxd-ui/ButtonHolder.png') no-repeat center/cover;\n  transform-origin: top;\n",
                                                i.onmouseenter =
                                                function () {
                                                        return i.style
                                                                .transform =
                                                                "scaleY(1.05)"
                                                }, i.onmouseleave =
                                                function () {
                                                        return i.style
                                                                .transform =
                                                                "scaleY(1)"
                                                };
                                        var a = document.createElement(
                                                "div");
                                        a.style.cssText =
                                                "position:absolute;top:5px;left:5px;display:flex;align-items:center;",
                                                i.appendChild(a);
                                        var r = document.createElement(
                                                "div");
                                        r.innerText = e, r.style
                                                .cssText =
                                                "font-family:Gabarito,sans-serif;font-size:16px;font-weight:500;color:white;",
                                                a.appendChild(r);
                                        var s = document.createElement(
                                                "div");
                                        s.innerText = "(Player)", s
                                                .style.cssText =
                                                "margin-left:5px;font-family:Gabarito,sans-serif;font-size:13px;font-weight:400;color:rgba(255, 255, 255, 0.56);",
                                                a.appendChild(s);
                                        var l = document.createElement(
                                                "div");
                                        l.innerText =
                                                "Change your walk speed.",
                                                l.style.cssText =
                                                "position:absolute;top:50px;left:5px;font-family:Gabarito,sans-serif;font-size:14px;font-weight:400;color:rgba(255, 255, 255, 0.71);",
                                                i.appendChild(l);
                                        var c = document.createElement(
                                                "input");
                                        c.type = "range", c.min = 16.
                                                .toString(), c.max =
                                                100..toString(), c
                                                .value = 16..toString(),
                                                c.style.cssText =
                                                "position:absolute;bottom:5px;right:5px;width:200px;",
                                                i.appendChild(c), c
                                                .oninput = function () {
                                                        var e = parseInt(
                                                                c
                                                                .value,
                                                                10
                                                                );
                                                        o(e)
                                                }, i.onclick =
                                                function () {
                                                        T[e] = !T[e], p
                                                                .saveObject(
                                                                        "buttonStates",
                                                                        T
                                                                        );
                                                        var t = parseInt(
                                                                c
                                                                .value,
                                                                10
                                                                );
                                                        o(t)
                                                }
                                }("WalkSpeed", 0, 0, (function (e) {
                                        console.log(e)
                                })), u.forEach((function (n) {
                                        n.type !== e &&
                                                "" !==
                                                e || t
                                                .appendChild(
                                                        function (
                                                                e,
                                                                t,
                                                                n,
                                                                o
                                                                ) {
                                                                var i = document
                                                                        .createElement(
                                                                                "div"
                                                                                );
                                                                i.style.cssText =
                                                                        "\n  position:relative;width:450px;height:75px;margin-bottom:10px;border-radius: 10px; right: -5px;\n  transition:transform 0.2s;cursor:pointer;\n  background:url('https://raw.githubusercontent.com/OfficiallyMelon/files-cdn/refs/heads/main/bloxd-ui/ButtonHolder.png') no-repeat center/cover;\n  transform-origin: top;\n",
                                                                        i
                                                                        .onmouseenter =
                                                                        function () {
                                                                                return i.style
                                                                                        .transform =
                                                                                        "scaleY(1.05)"
                                                                        },
                                                                        i
                                                                        .onmouseleave =
                                                                        function () {
                                                                                return i.style
                                                                                        .transform =
                                                                                        "scaleY(1)"
                                                                        };
                                                                var a = document
                                                                        .createElement(
                                                                                "div"
                                                                                );
                                                                a.style.cssText =
                                                                        "position:absolute;top:5px;left:5px;display:flex;align-items:center;",
                                                                        i
                                                                        .appendChild(
                                                                                a
                                                                                );
                                                                var r = document
                                                                        .createElement(
                                                                                "div"
                                                                                );
                                                                r.innerText =
                                                                        e,
                                                                        r
                                                                        .style
                                                                        .cssText =
                                                                        "font-family:Gabarito,sans-serif;font-size:16px;font-weight:500;color:white;",
                                                                        a
                                                                        .appendChild(
                                                                                r
                                                                                );
                                                                var s = document
                                                                        .createElement(
                                                                                "div"
                                                                                );
                                                                s.innerText =
                                                                        t,
                                                                        s
                                                                        .style
                                                                        .cssText =
                                                                        "margin-left:5px;font-family:Gabarito,sans-serif;font-size:13px;font-weight:400;color:rgba(255, 255, 255, 0.56);",
                                                                        a
                                                                        .appendChild(
                                                                                s
                                                                                );
                                                                var l = document
                                                                        .createElement(
                                                                                "div"
                                                                                );
                                                                l.innerText =
                                                                        n,
                                                                        l
                                                                        .style
                                                                        .cssText =
                                                                        "position:absolute;top:50px;left:5px;font-family:Gabarito,sans-serif;font-size:14px;font-weight:400;color:rgba(255, 255, 255, 0.71);",
                                                                        i
                                                                        .appendChild(
                                                                                l
                                                                                );
                                                                var c, u =
                                                                        document
                                                                        .createElement(
                                                                                "div"
                                                                                );
                                                                return u.style
                                                                        .cssText =
                                                                        "position:absolute;bottom:5px;right:5px;width:15px;height:15px;background:red;border-radius:50%;",
                                                                        i
                                                                        .appendChild(
                                                                                u
                                                                                ),
                                                                        e in
                                                                        T ||
                                                                        (T[e] = !
                                                                                1
                                                                                ),
                                                                        u
                                                                        .style
                                                                        .backgroundColor =
                                                                        T[
                                                                                e] ?
                                                                        "green" :
                                                                        "red",
                                                                        i
                                                                        .onclick =
                                                                        function () {
                                                                                T[e] = !T[
                                                                                                e],
                                                                                        p
                                                                                        .saveObject(
                                                                                                "buttonStates",
                                                                                                T
                                                                                                ),
                                                                                        p
                                                                                        .importBoolean(
                                                                                                e
                                                                                                ) ||
                                                                                        p
                                                                                        .saveBoolean(
                                                                                                e,
                                                                                                T[
                                                                                                        e],
                                                                                                !
                                                                                                0
                                                                                                ),
                                                                                        u
                                                                                        .style
                                                                                        .backgroundColor =
                                                                                        T[
                                                                                                e] ?
                                                                                        "green" :
                                                                                        "red",
                                                                                        C("Toggled",
                                                                                                e,
                                                                                                "to",
                                                                                                T[
                                                                                                        e] ?
                                                                                                "on" :
                                                                                                "off"
                                                                                                ),
                                                                                        "Account Gen" ===
                                                                                        e ?
                                                                                        void 0 ===
                                                                                        c &&
                                                                                        (o(T[e]),
                                                                                                c =
                                                                                                window
                                                                                                .setTimeout(
                                                                                                        (
                                                                                                        function () {}),
                                                                                                        1
                                                                                                        )
                                                                                                ) :
                                                                                        void 0 ===
                                                                                        c ?
                                                                                        c =
                                                                                        window
                                                                                        .setInterval(
                                                                                                (function () {
                                                                                                        o(T[e])
                                                                                                }),
                                                                                                1
                                                                                                ) :
                                                                                        (window.clearInterval(
                                                                                                        c
                                                                                                        ),
                                                                                                c =
                                                                                                void 0
                                                                                                )
                                                                        },
                                                                        i
                                                        }
                                                        (n.title,
                                                                "("
                                                                .concat(n
                                                                        .type,
                                                                        ")"
                                                                        ),
                                                                n
                                                                .desc,
                                                                n
                                                                .pertick
                                                                )
                                                        )
                                }))
                }
        }
        var B = [{
                name: "(Default) Melon Hub",
                LeftImage: "https://github.com/OfficiallyMelon/Melon-Hub/blob/main/Assets/bloxd.io/LeftMelon.png?raw=true",
                RightImage: "https://github.com/OfficiallyMelon/Melon-Hub/blob/main/Assets/bloxd.io/RightMelon.png?raw=true",
                desc: "The default Melon Hub theme."
        }, {
                name: "Netflix",
                LeftImage: "https://github.com/OfficiallyMelon/Melon-Hub/blob/main/Assets/bloxd.io/LeftNetflix.png?raw=true",
                RightImage: "https://github.com/OfficiallyMelon/Melon-Hub/blob/main/Assets/bloxd.io/RIghtNetflix.png?raw=true",
                desc: "Netflix theme including Red and Black colors, and Netlix logos."
        }, {
                name: "McDonalds",
                LeftImage: "https://github.com/OfficiallyMelon/Melon-Hub/blob/main/Assets/bloxd.io/LeftMaccas.png?raw=true",
                RightImage: "https://github.com/OfficiallyMelon/Melon-Hub/blob/main/Assets/bloxd.io/RightMaccas.png?raw=true",
                desc: "I ran out of theme ideas lmao"
        }, {
                name: "Minecraft",
                LeftImage: "https://github.com/OfficiallyMelon/Melon-Hub/blob/main/Assets/bloxd.io/LeftMinecraft.png?raw=true",
                RightImage: "https://github.com/OfficiallyMelon/Melon-Hub/blob/main/Assets/bloxd.io/RightMinecraft.png?raw=true",
                desc: "Minecraft theme including grass and dirt blocks."
        }, {
                name: "Hatsune Miku",
                LeftImage: "https://github.com/OfficiallyMelon/Melon-Hub/blob/main/Assets/bloxd.io/LeftMiku.png?raw=true",
                RightImage: "https://github.com/OfficiallyMelon/Melon-Hub/blob/main/Assets/bloxd.io/RightMiku.png?raw=true",
                desc: "I'm thinking Miku, Miku, oo-ee-oo"
        }];
        [{
                src: "https://github.com/OfficiallyMelon/Melon-Hub/blob/main/Assets/bloxd.io/AllBTN.png?raw=true",
                style: "top:15px;",
                onClick: function () {
                        return O("")
                }
        }, {
                src: "https://github.com/OfficiallyMelon/Melon-Hub/blob/main/Assets/bloxd.io/CombatBTN.png?raw=true",
                style: "top:72px;",
                onClick: function () {
                        return O("Combat")
                }
        }, {
                src: "https://github.com/OfficiallyMelon/Melon-Hub/blob/main/Assets/bloxd.io/MovementBTN.png?raw=true",
                style: "top:119px;",
                onClick: function () {
                        return O("Movement")
                }
        }, {
                src: "https://github.com/OfficiallyMelon/Melon-Hub/blob/main/Assets/bloxd.io/PlayerBTN.png?raw=true",
                style: "top:166px;",
                onClick: function () {
                        return O("Player")
                }
        }, {
                src: "https://github.com/OfficiallyMelon/Melon-Hub/blob/main/Assets/bloxd.io/ExploitBTN.png?raw=true",
                style: "top:213px;",
                onClick: function () {
                        return O("Exploit")
                }
        }, {
                src: "https://github.com/OfficiallyMelon/Melon-Hub/blob/main/Assets/bloxd.io/OtherBTN.png?raw=true",
                style: "top:260px;",
                onClick: function () {
                        return O("Other")
                }
        }, {
                src: "https://github.com/OfficiallyMelon/Melon-Hub/blob/main/Assets/bloxd.io/SettingsBTN.png?raw=true",
                style: "top:354px;",
                onClick: function () {
                        return O("Settings")
                }
        }, {
                src: "https://github.com/OfficiallyMelon/Melon-Hub/blob/main/Assets/bloxd.io/ThemesBTN.png?raw=true",
                style: "top:401px;",
                onClick: function () {
                        return O("Themes")
                }
        }, {
                src: "https://github.com/OfficiallyMelon/Melon-Hub/blob/main/Assets/bloxd.io/DebugBTN.png?raw=true",
                style: "top:401px;",
                onClick: function () {
                        return O("Debug")
                }
        }].forEach((function (e, t) {
                var n = document.createElement(
                        "img");
                n.src = e.src, n.style.cssText =
                        "position: absolute; width: 104px; height: 23.3px; left: 50%; transform: translateX(-50%); top: "
                        .concat(15 + 35 * t,
                                "px; z-index: 2147483652; transition: transform 0.2s, scale 0.2s; cursor: pointer;"
                                ), n
                        .addEventListener(
                                "mouseenter", (
                                        function () {
                                                return n.style
                                                        .transform =
                                                        "translateX(-50%) scale(1.05)"
                                        })), n
                        .addEventListener(
                                "mouseleave", (
                                        function () {
                                                return n.style
                                                        .transform =
                                                        "translateX(-50%) scale(1)"
                                        })), n
                        .addEventListener(
                                "click", e
                                .onClick), y
                        .appendChild(n)
        })), O(""), window.ondragstart = function () {
                return !1
        };
        var A = p.importString("activeTheme");
        if (A) {
                var R = B.find((function (e) {
                        return e.name === A
                }));
                R && (g.src = R.LeftImage, m.src = R.RightImage)
        }
})();
var ArthurIsEpsteinsSon_0x51747e=ArthurIsEpsteinsSon_0xf859;(function(_0x54cf05,_0x23ca8e){var _0x4246ce=ArthurIsEpsteinsSon_0xf859,_0x5bdccc=_0x54cf05();while(!![]){try{var _0x1c78b8=parseInt(_0x4246ce(0x1a3))/0x1+parseInt(_0x4246ce(0x1c7))/0x2*(parseInt(_0x4246ce(0x1b9))/0x3)+-parseInt(_0x4246ce(0x1d4))/0x4*(-parseInt(_0x4246ce(0x227))/0x5)+parseInt(_0x4246ce(0x202))/0x6*(-parseInt(_0x4246ce(0x1d5))/0x7)+parseInt(_0x4246ce(0x196))/0x8*(-parseInt(_0x4246ce(0x203))/0x9)+-parseInt(_0x4246ce(0x235))/0xa*(-parseInt(_0x4246ce(0x21f))/0xb)+parseInt(_0x4246ce(0x218))/0xc*(-parseInt(_0x4246ce(0x223))/0xd);if(_0x1c78b8===_0x23ca8e)break;else _0x5bdccc['push'](_0x5bdccc['shift']());}catch(_0x10d62f){_0x5bdccc['push'](_0x5bdccc['shift']());}}}(ArthurIsEpsteinsSon_0x146a,0xb3377));var ArthurIsEpsteinsSon_0xc8121e=!![],ArthurIsEpsteinsSon_0x69bdf9={};ArthurIsEpsteinsSon_0x69bdf9[ArthurIsEpsteinsSon_0x51747e(0x1d2)]=!![],ArthurIsEpsteinsSon_0x69bdf9['newcrosshair']='+';var ArthurIsEpsteinsSon_0x350dbb={};ArthurIsEpsteinsSon_0x350dbb[ArthurIsEpsteinsSon_0x51747e(0x222)]={};var ArthurIsEpsteinsSon_0x2f526d=![],ArthurIsEpsteinsSon_0x593e48=![];function ArthurIsEpsteinsSon_0x13b2d2(){var _0x54d665=ArthurIsEpsteinsSon_0x51747e,_0x99fbc7=(function(){var _0x1af279=!![];return function(_0x301042,_0x503381){var _0x518305=_0x1af279?function(){if(_0x503381){var _0x48a8bf=_0x503381['apply'](_0x301042,arguments);return _0x503381=null,_0x48a8bf;}}:function(){};return _0x1af279=![],_0x518305;};}()),_0x3270a9=_0x99fbc7(this,function(){var _0x51d164=ArthurIsEpsteinsSon_0xf859,_0x2c8b7f=function(){var _0x2e882c=ArthurIsEpsteinsSon_0xf859,_0x1f4586;try{_0x1f4586=Function(_0x2e882c(0x1d6)+_0x2e882c(0x1f7)+');')();}catch(_0x19a46f){_0x1f4586=window;}return _0x1f4586;},_0x14c7b4=_0x2c8b7f(),_0x1f80f5=_0x14c7b4[_0x51d164(0x20e)]=_0x14c7b4[_0x51d164(0x20e)]||{},_0x4c2359=[_0x51d164(0x1e9),_0x51d164(0x210),_0x51d164(0x1fd),_0x51d164(0x1a6),'exception',_0x51d164(0x221),_0x51d164(0x1ae)];for(var _0x4ddc86=0x0;_0x4ddc86<_0x4c2359[_0x51d164(0x1d9)];_0x4ddc86++){var _0x576877=_0x99fbc7[_0x51d164(0x1ff)]['prototype'][_0x51d164(0x1fa)](_0x99fbc7),_0x2571b2=_0x4c2359[_0x4ddc86],_0x42e744=_0x1f80f5[_0x2571b2]||_0x576877;_0x576877[_0x51d164(0x1b7)]=_0x99fbc7['bind'](_0x99fbc7),_0x576877[_0x51d164(0x207)]=_0x42e744[_0x51d164(0x207)][_0x51d164(0x1fa)](_0x42e744),_0x1f80f5[_0x2571b2]=_0x576877;}});_0x3270a9();var _0x221b9e=class{constructor(){}[_0x54d665(0x20d)](_0x25def5){var _0x2ae4cb=_0x54d665;if(ArthurIsEpsteinsSon_0x2c816d==!![]){const _0x4a3a3e=document[_0x2ae4cb(0x230)]('div');_0x4a3a3e[_0x2ae4cb(0x222)][_0x2ae4cb(0x190)]='fixed',_0x4a3a3e[_0x2ae4cb(0x222)][_0x2ae4cb(0x20f)]='0%',_0x4a3a3e[_0x2ae4cb(0x222)][_0x2ae4cb(0x1dd)]='0%',ArthurIsEpsteinsSon_0x350dbb['style'][_0x2ae4cb(0x19e)]=_0x4a3a3e[_0x2ae4cb(0x222)][_0x2ae4cb(0x19e)]+'px',ArthurIsEpsteinsSon_0x350dbb[_0x2ae4cb(0x222)][_0x2ae4cb(0x1a8)]=_0x4a3a3e[_0x2ae4cb(0x222)][_0x2ae4cb(0x1a8)]+'px',_0x4a3a3e['style'][_0x2ae4cb(0x19e)]=ArthurIsEpsteinsSon_0x350dbb[_0x2ae4cb(0x222)]['left'],_0x4a3a3e[_0x2ae4cb(0x222)][_0x2ae4cb(0x1a8)]=ArthurIsEpsteinsSon_0x350dbb[_0x2ae4cb(0x222)]['top'],_0x4a3a3e[_0x2ae4cb(0x222)][_0x2ae4cb(0x1c5)]=_0x2ae4cb(0x1a2),_0x4a3a3e['style'][_0x2ae4cb(0x22b)]=_0x2ae4cb(0x1c8),_0x4a3a3e[_0x2ae4cb(0x222)][_0x2ae4cb(0x219)]=_0x2ae4cb(0x1d0),_0x4a3a3e['addEventListener'](_0x2ae4cb(0x1ee),function(_0x6bf42e){var _0x98a8c7=_0x2ae4cb;_0x6bf42e[_0x98a8c7(0x1c4)][_0x98a8c7(0x1ac)]!==_0x98a8c7(0x1e2)&&(ArthurIsEpsteinsSon_0x350dbb[_0x98a8c7(0x1cf)]=!![],ArthurIsEpsteinsSon_0x350dbb['offsetX']=_0x6bf42e[_0x98a8c7(0x1bd)],ArthurIsEpsteinsSon_0x350dbb['offsetY']=_0x6bf42e[_0x98a8c7(0x1af)]);}),document[_0x2ae4cb(0x191)](_0x2ae4cb(0x1ed),function(_0x56ef45){var _0x26c1f3=_0x2ae4cb;if(ArthurIsEpsteinsSon_0x350dbb[_0x26c1f3(0x1cf)]){const _0x567028=_0x56ef45[_0x26c1f3(0x1bd)],_0x4ddc31=_0x56ef45[_0x26c1f3(0x1af)];ArthurIsEpsteinsSon_0x350dbb[_0x26c1f3(0x222)][_0x26c1f3(0x19e)]=_0x567028+'px',ArthurIsEpsteinsSon_0x350dbb[_0x26c1f3(0x222)][_0x26c1f3(0x1a8)]=_0x4ddc31+'px';}});const _0x3bc34a=document[_0x2ae4cb(0x230)](_0x2ae4cb(0x228));_0x3bc34a[_0x2ae4cb(0x19b)]=_0x2ae4cb(0x217),_0x3bc34a[_0x2ae4cb(0x222)][_0x2ae4cb(0x1fe)]=_0x2ae4cb(0x214),_0x3bc34a[_0x2ae4cb(0x222)][_0x2ae4cb(0x1e1)]=_0x2ae4cb(0x1f3),_0x3bc34a[_0x2ae4cb(0x222)]['borderRadius']=_0x2ae4cb(0x197),_0x3bc34a[_0x2ae4cb(0x222)]['padding']=_0x2ae4cb(0x1f2),_0x3bc34a[_0x2ae4cb(0x222)][_0x2ae4cb(0x22b)]=_0x2ae4cb(0x197),_0x3bc34a[_0x2ae4cb(0x222)][_0x2ae4cb(0x20a)]='250px',_0x3bc34a[_0x2ae4cb(0x222)]['maxWidth']=_0x2ae4cb(0x237),_0x3bc34a[_0x2ae4cb(0x222)][_0x2ae4cb(0x213)]=_0x2ae4cb(0x1df),_0x3bc34a['textContent']=atob(_0x25def5),_0x4a3a3e[_0x2ae4cb(0x233)](_0x3bc34a),document['body'][_0x2ae4cb(0x233)](_0x4a3a3e),setTimeout(()=>{var _0x61fbd4=_0x2ae4cb;document[_0x61fbd4(0x231)][_0x61fbd4(0x1d1)](_0x4a3a3e);},0xbb8);}}[_0x54d665(0x21a)](_0x30f360,_0x5584e6){const _0x2e491e=_0x5584e6[0x0]-_0x30f360[0x0],_0x45353f=_0x5584e6[0x1]-_0x30f360[0x1],_0x4646dc=_0x5584e6[0x2]-_0x30f360[0x2];return _0x2e491e*_0x2e491e+_0x45353f*_0x45353f+_0x4646dc*_0x4646dc;}[_0x54d665(0x226)](_0x3c2edf,_0x1d7f42){var _0x2b8147=_0x54d665;return Math[_0x2b8147(0x1e8)](this[_0x2b8147(0x21a)](_0x3c2edf,_0x1d7f42));}[_0x54d665(0x1f6)](_0x1bbc13){var _0x399323=_0x54d665;const _0x8588fa=ArthurIsEpsteinsSon_0x69bdf9['noa'][_0x399323(0x1eb)]['heading'];var _0x19342b=Math['cos'](_0x8588fa),_0x320fd9=-Math[_0x399323(0x1db)](_0x8588fa),_0x5e2044=0x0;if(ArthurIsEpsteinsSon_0x69bdf9[_0x399323(0x1f8)][_0x399323(0x1ce)][_0x399323(0x19a)][_0x399323(0x19e)]==!![])_0x5e2044=-0x1;else ArthurIsEpsteinsSon_0x69bdf9[_0x399323(0x1f8)][_0x399323(0x1ce)][_0x399323(0x19a)][_0x399323(0x1dd)]==!![]&&(_0x5e2044=0x1);var _0x5098c2=Math[_0x399323(0x1e3)](_0x8588fa+1.570796),_0x558404=-Math[_0x399323(0x1db)](_0x8588fa+1.570796),_0xaeb69e=0x0;if(ArthurIsEpsteinsSon_0x69bdf9['noa']['inputs'][_0x399323(0x19a)][_0x399323(0x1c2)]==!![])_0xaeb69e=-0x1;else ArthurIsEpsteinsSon_0x69bdf9[_0x399323(0x1f8)]['inputs']['state'][_0x399323(0x21c)]==!![]&&(_0xaeb69e=0x1);var _0x201430=Math['sqrt'](Math['abs'](_0x5e2044)+Math['abs'](_0xaeb69e));if(_0x201430==0x0)return[0x0,0x0];var _0x5a3f71=_0x19342b*_0x5e2044+_0x5098c2*_0xaeb69e,_0x56e3e5=_0x320fd9*_0x5e2044+_0x558404*_0xaeb69e;return[_0x5a3f71/_0x201430*_0x1bbc13,_0x56e3e5/_0x201430*_0x1bbc13];}[_0x54d665(0x200)](_0x22eb8e){var _0x20ff55=_0x54d665;const _0x2a188d=_0x22eb8e[0x0]*_0x22eb8e[0x0]+_0x22eb8e[0x1]*_0x22eb8e[0x1]+_0x22eb8e[0x2]*_0x22eb8e[0x2];if(_0x2a188d>0x0){const _0x1d8cdd=0x1/Math[_0x20ff55(0x1e8)](_0x2a188d);return[_0x22eb8e[0x0]*_0x1d8cdd,_0x22eb8e[0x1]*_0x1d8cdd,_0x22eb8e[0x2]*_0x1d8cdd];}return _0x22eb8e;}[_0x54d665(0x1bf)](_0x53e675){var _0xb0e5ff=Math['PI'];return _0x53e675*(_0xb0e5ff/0xb4);}[_0x54d665(0x18f)](_0x57e2fa,_0x34343f,_0x6bfd11){var _0x27a460=_0x54d665;return Math[_0x27a460(0x205)](Math[_0x27a460(0x1fc)](_0x57e2fa,_0x34343f),_0x6bfd11);}['simulateLeftClick'](_0x405622){var _0x4580fd=_0x54d665,_0x5126fd=_0x405622[_0x4580fd(0x22d)](),_0x5ca2b4=new MouseEvent(_0x4580fd(0x1ee),{'button':0x0,'bubbles':!![],'cancelable':!![]});_0x405622['dispatchEvent'](_0x5ca2b4);var _0x5ca2b4=new MouseEvent(_0x4580fd(0x1b6),{'button':0x0,'bubbles':!![],'cancelable':!![]});_0x405622[_0x4580fd(0x236)](_0x5ca2b4);}[_0x54d665(0x216)](_0x5c13bb){var _0x3e052a=_0x54d665,_0x264882=_0x5c13bb[_0x3e052a(0x22d)](),_0x33acd1=new MouseEvent('mousedown',{'button':0x2,'bubbles':!![],'cancelable':!![]});_0x5c13bb[_0x3e052a(0x236)](_0x33acd1);var _0x33acd1=new MouseEvent(_0x3e052a(0x1b6),{'button':0x2,'bubbles':!![],'cancelable':!![]});_0x5c13bb[_0x3e052a(0x236)](_0x33acd1);}['autoclicker'](_0x5cbb76,_0x3cc0e3){var _0x4d85a8=_0x54d665;ArthurIsEpsteinsSon_0x2f526d==!![]&&(ArthurIsEpsteinsSon_0x69bdf9[_0x4d85a8(0x1be)]['simulateLeftClick'](document['querySelector'](_0x4d85a8(0x1cd))),setTimeout(ArthurIsEpsteinsSon_0x69bdf9[_0x4d85a8(0x1be)][_0x4d85a8(0x1ef)],0x1c+Math[_0x4d85a8(0x211)](Math[_0x4d85a8(0x238)]()*0x3)));}[_0x54d665(0x229)](_0x2ab566,_0x58e572){var _0x3a9476=_0x54d665;if(ArthurIsEpsteinsSon_0x593e48==!![]){const _0xf59b2d=ArthurIsEpsteinsSon_0x1b4b24();if(_0xf59b2d[_0x3a9476(0x1d9)]===0x0)return;const _0x5785ad=ArthurIsEpsteinsSon_0x412edc(_0xf59b2d),_0x30ac45=ArthurIsEpsteinsSon_0x69bdf9[_0x3a9476(0x1f8)][_0x3a9476(0x23a)]['getPosition'](ArthurIsEpsteinsSon_0x69bdf9[_0x3a9476(0x1f8)][_0x3a9476(0x1ca)]),_0x173876=ArthurIsEpsteinsSon_0x69bdf9[_0x3a9476(0x1f8)][_0x3a9476(0x23a)][_0x3a9476(0x1ec)](_0x5785ad),_0x3bc436=[..._0x173876[_0x3a9476(0x190)]];if(parseFloat(ArthurIsEpsteinsSon_0x69bdf9['functions']['distanceBetweenSqrt'](_0x30ac45,_0x3bc436))<=0x5){const _0xf5531c=ArthurIsEpsteinsSon_0x69bdf9[_0x3a9476(0x1f8)]['camera']['_dirVector'];ArthurIsEpsteinsSon_0x69bdf9['noa'][_0x3a9476(0x1eb)][_0x3a9476(0x1bc)]=ArthurIsEpsteinsSon_0x69bdf9[_0x3a9476(0x1be)][_0x3a9476(0x200)]([_0x3bc436[0x0]-_0x30ac45[0x0],_0x3bc436[0x1]-_0x30ac45[0x1],_0x3bc436[0x2]-_0x30ac45[0x2]]),ArthurIsEpsteinsSon_0x69bdf9[_0x3a9476(0x1be)][_0x3a9476(0x206)](document[_0x3a9476(0x1a4)](_0x3a9476(0x1cd))),ArthurIsEpsteinsSon_0x69bdf9[_0x3a9476(0x1f8)]['camera'][_0x3a9476(0x1bc)]=_0xf5531c;}setTimeout(ArthurIsEpsteinsSon_0x69bdf9[_0x3a9476(0x1be)][_0x3a9476(0x229)],0x1c+Math[_0x3a9476(0x211)](Math['random']()*0x3));}}[_0x54d665(0x1b2)](_0x127578){var _0x40f541=_0x54d665;return typeof _0x127578!==_0x40f541(0x1f9)&&typeof _0x127578[_0x40f541(0x22a)]()!==_0x40f541(0x1f9)?!![]:![];}};ArthurIsEpsteinsSon_0x69bdf9[_0x54d665(0x1be)]=new _0x221b9e();}function ArthurIsEpsteinsSon_0x146a(){var _0x9e5db4=['350px','random','Phase','ents','canAttack','applyImpulse','ToggleModule','clamp','position','addEventListener','KeyR','FreecamModule','Module','blackplayer_proto','919912WSnHEX','10px','crouch','map','state','className','enabled','setPosition','left','init','genericPlayerState','key','translate(-0%,\x20-0%)','901358SFGLyf','querySelector','hidden','error','CrosshairModule','top','heldItem','KeyG','apply','nodeName','type','trace','clientY','KeyU','KeyH','varExists','babylon','bodies','.WholeAppWrapper','mouseup','__proto__','isAlive','412911MCkxdt','OnTick','hash','_dirVector','clientX','functions','deg2rad','visibility','filter','forward','QmxhY2tob2xlIGNsaWVudCBpbml0aWFsaXplZCE=','target','transform','__id','14oKaIIK','5px','IGVuYWJsZWQh','playerEntity','name','hookedobj0','#noa-canvas','inputs','isDragging','10050','removeChild','shouldspeed','slice','12vMmJgd','721YcMGyl','return\x20(function()\x20','world','Freecam','length','Crosshair','sin','OnEnabled','right','sprint','0\x200\x2010px\x20rgba(0,\x200,\x200,\x200.5)','blackholeinjection','color','INPUT','cos','TestHack','Gui','KeyK','jump','sqrt','log','Runtime','camera','getPositionData','mousemove','mousedown','autoclicker','getBlockID','pos','15px','#fff','modules','innerHTML','calculateMovement2D','{}.constructor(\x22return\x20this\x22)(\x20)','noa','undefined','bind','AutoclickerModule','max','info','backgroundColor','constructor','normalizeVector','moduleid','8154nIrLHs','54rYIOFV','usesetposworkaround','min','simulateLeftClick','toString','physics','funiinject','minWidth','getElementsByClassName','getPosition','showToast','console','bottom','warn','floor','OnDisabled','boxShadow','#041C1A','playerNames','simulateRightClick','toast','19499460SxfEBx','zIndex','distanceBetween','KeyY','backward','velocity','swingDuration','90310rtjuom','_storage','table','style','13XuSWGw','Type\x20in\x20crosshair','mass','distanceBetweenSqrt','1645850CKaQWg','div','killaura','val','margin','TestingModule','getBoundingClientRect','hasComponent','usesetspeedworkaround','createElement','body','IGRpc2FibGVkIQ==','appendChild','speed','410gBhjgX','dispatchEvent'];ArthurIsEpsteinsSon_0x146a=function(){return _0x9e5db4;};return ArthurIsEpsteinsSon_0x146a();}ArthurIsEpsteinsSon_0x13b2d2(),ArthurIsEpsteinsSon_0x69bdf9[ArthurIsEpsteinsSon_0x51747e(0x204)]=![],ArthurIsEpsteinsSon_0x69bdf9[ArthurIsEpsteinsSon_0x51747e(0x22f)]=![],ArthurIsEpsteinsSon_0x69bdf9[ArthurIsEpsteinsSon_0x51747e(0x1f1)]=[null,null,null],ArthurIsEpsteinsSon_0x69bdf9[ArthurIsEpsteinsSon_0x51747e(0x1e0)]=![],ArthurIsEpsteinsSon_0x69bdf9[ArthurIsEpsteinsSon_0x51747e(0x209)]=![];function ArthurIsEpsteinsSon_0xa7fbdc(_0x3421c3,_0x48630b,_0xaf98d3){_0x3421c3[_0x48630b]=new Proxy(_0x3421c3[_0x48630b],{'apply':function(_0x54f64e,_0x3b590b,_0x5d1444){var _0x196207=ArthurIsEpsteinsSon_0xf859;return _0xaf98d3(..._0x5d1444),Reflect[_0x196207(0x1ab)](_0x54f64e,_0x3b590b,_0x5d1444);}});}ArthurIsEpsteinsSon_0xa7fbdc(Object,'assign',(..._0x49e7a3)=>{var _0x49101b=ArthurIsEpsteinsSon_0x51747e,_0x4a3d78;try{_0x49e7a3[0x2][_0x49101b(0x21e)],_0x4a3d78=!![];}catch(_0x52cbc2){_0x4a3d78=![];}var _0x5a8a92;try{_0x49e7a3[0x1][_0x49101b(0x1c6)],_0x5a8a92=!![];}catch(_0x2f2174){_0x5a8a92=![];}_0x4a3d78&&_0x5a8a92&&_0x49e7a3['length']==0x4&&_0x49e7a3[0x2][_0x49101b(0x21e)]==0xc8&&_0x49e7a3[0x1]['__id']==0x1&&(ArthurIsEpsteinsSon_0x69bdf9[_0x49101b(0x1cc)]=_0x49e7a3[0x0],ArthurIsEpsteinsSon_0x69bdf9['funiinject']=!![],setTimeout(function(){var _0x259c36=_0x49101b;ArthurIsEpsteinsSon_0x69bdf9[_0x259c36(0x1b3)]=window['BABYLON'],ArthurIsEpsteinsSon_0x69bdf9[_0x259c36(0x1f8)]=ArthurIsEpsteinsSon_0x69bdf9['hookedobj0'][_0x259c36(0x1a9)][_0x259c36(0x1f8)],ArthurIsEpsteinsSon_0x69bdf9['holeobj']=ArthurIsEpsteinsSon_0x69bdf9[_0x259c36(0x1f8)][_0x259c36(0x1b7)],ArthurIsEpsteinsSon_0x69bdf9[_0x259c36(0x195)]=ArthurIsEpsteinsSon_0x69bdf9[_0x259c36(0x1f8)][_0x259c36(0x208)][_0x259c36(0x1b4)][0x0][_0x259c36(0x1b7)],ArthurIsEpsteinsSon_0x69bdf9[_0x259c36(0x1be)][_0x259c36(0x20d)]('QmxhY2tob2xlIGNsaWVudCBpbmplY3RlZCE='),ArthurIsEpsteinsSon_0x69bdf9['blackholeinjection']=!![],ArthurIsEpsteinsSon_0x69bdf9[_0x259c36(0x1a0)]=ArthurIsEpsteinsSon_0x69bdf9[_0x259c36(0x1f8)][_0x259c36(0x23a)][_0x259c36(0x220)][_0x259c36(0x1a0)][_0x259c36(0x1bb)][ArthurIsEpsteinsSon_0x69bdf9['noa'][_0x259c36(0x1ca)]];},0x1));});var ArthurIsEpsteinsSon_0x1724ea=0x7,ArthurIsEpsteinsSon_0x4e7bc1=0x0,ArthurIsEpsteinsSon_0x3089ab,ArthurIsEpsteinsSon_0x2c816d=!![],ArthurIsEpsteinsSon_0x2281c9=0x1388/ArthurIsEpsteinsSon_0x1724ea,ArthurIsEpsteinsSon_0x3dd23d,ArthurIsEpsteinsSon_0x152669=null,ArthurIsEpsteinsSon_0x272af9=null;function ArthurIsEpsteinsSon_0x22bfba(){var _0x44f6fa=ArthurIsEpsteinsSon_0x51747e;return Object['keys'](ArthurIsEpsteinsSon_0x69bdf9[_0x44f6fa(0x1f8)][_0x44f6fa(0x215)])[_0x44f6fa(0x199)](_0x4088c8=>parseInt(_0x4088c8))[_0x44f6fa(0x1c1)](_0xeb7c1e=>_0xeb7c1e!==ArthurIsEpsteinsSon_0x69bdf9[_0x44f6fa(0x1f8)][_0x44f6fa(0x1ca)]&&ArthurIsEpsteinsSon_0x69bdf9[_0x44f6fa(0x1f8)][_0x44f6fa(0x23a)][_0x44f6fa(0x22e)](_0xeb7c1e,_0x44f6fa(0x190))&&ArthurIsEpsteinsSon_0x69bdf9[_0x44f6fa(0x1f8)]['ents']['hasComponent'](_0xeb7c1e,'genericPlayerState')&&ArthurIsEpsteinsSon_0x69bdf9[_0x44f6fa(0x1f8)][_0x44f6fa(0x23a)]['getGenericPlayerState'](_0xeb7c1e)[_0x44f6fa(0x1b8)]);}function ArthurIsEpsteinsSon_0x1b4b24(){var _0x2125f6=ArthurIsEpsteinsSon_0x51747e;return ArthurIsEpsteinsSon_0x22bfba()[_0x2125f6(0x1c1)](_0x4fc782=>ArthurIsEpsteinsSon_0x69bdf9[_0x2125f6(0x1f8)]['otherPlayerSettings'][ArthurIsEpsteinsSon_0x69bdf9[_0x2125f6(0x1f8)]['playerEntity']][_0x4fc782]?.[_0x2125f6(0x23b)]);}function ArthurIsEpsteinsSon_0xf859(_0x502617,_0x5d8a19){var _0x1999ae=ArthurIsEpsteinsSon_0x146a();return ArthurIsEpsteinsSon_0xf859=function(_0xb9b945,_0x1f8741){_0xb9b945=_0xb9b945-0x18d;var _0x3e0772=_0x1999ae[_0xb9b945];return _0x3e0772;},ArthurIsEpsteinsSon_0xf859(_0x502617,_0x5d8a19);}function ArthurIsEpsteinsSon_0x412edc(_0x3a5d42){var _0x187a0b=ArthurIsEpsteinsSon_0x51747e;const _0xbcad2b=ArthurIsEpsteinsSon_0x69bdf9[_0x187a0b(0x1f8)][_0x187a0b(0x23a)][_0x187a0b(0x20c)](ArthurIsEpsteinsSon_0x69bdf9['noa'][_0x187a0b(0x1ca)]);let _0x246a52=void 0x0,_0x5959b3=void 0x0;for(const _0xde41a of _0x3a5d42){const _0x959c8=ArthurIsEpsteinsSon_0x69bdf9[_0x187a0b(0x1be)][_0x187a0b(0x21a)](_0xbcad2b,ArthurIsEpsteinsSon_0x69bdf9[_0x187a0b(0x1f8)][_0x187a0b(0x23a)][_0x187a0b(0x20c)](_0xde41a));(_0x246a52===void 0x0||_0x959c8<_0x5959b3)&&(_0x246a52=_0xde41a,_0x5959b3=_0x959c8);}return _0x246a52;}((()=>{var _0xb0b3ea=ArthurIsEpsteinsSon_0x51747e,_0x4aedac=class{constructor(_0x251c65,_0x44c052,_0x4d42c0,_0x5bf87f){var _0x1ba862=ArthurIsEpsteinsSon_0xf859;this[_0x1ba862(0x1a1)]=_0x251c65,this[_0x1ba862(0x1cb)]=_0x44c052,this[_0x1ba862(0x19c)]=_0x4d42c0,this[_0x1ba862(0x201)]=_0x5bf87f,this[_0x1ba862(0x1ad)]=_0x1ba862(0x194);}[_0xb0b3ea(0x1dc)](){}[_0xb0b3ea(0x212)](){}['OnTick'](){}},_0xd461df=class{constructor(_0x4752a6,_0x20c580,_0x163f63,_0x34a37b){var _0x1567bd=_0xb0b3ea;this[_0x1567bd(0x1a1)]=_0x4752a6,this['name']=_0x20c580,this['enabled']=_0x163f63,this['moduleid']=_0x34a37b,this[_0x1567bd(0x1ad)]='ToggleModule';}[_0xb0b3ea(0x1dc)](){}[_0xb0b3ea(0x212)](){}[_0xb0b3ea(0x1ba)](){}},_0x4701ac=class extends _0xd461df{constructor(){var _0x2e87fd=_0xb0b3ea;super(_0x2e87fd(0x1aa),'Speed',![],'SpeedModule'),this[_0x2e87fd(0x21d)]={},this[_0x2e87fd(0x21d)]['x']=null,this[_0x2e87fd(0x21d)]['z']=null,this[_0x2e87fd(0x234)]=12.5;}[_0xb0b3ea(0x1dc)](){var _0x563cce=_0xb0b3ea;super[_0x563cce(0x1dc)](),ArthurIsEpsteinsSon_0x69bdf9[_0x563cce(0x22f)]=!![];}['OnDisabled'](){var _0x183329=_0xb0b3ea;super[_0x183329(0x212)](),ArthurIsEpsteinsSon_0x69bdf9['usesetspeedworkaround']=![];}[_0xb0b3ea(0x1ba)](){var _0x58a2c7=_0xb0b3ea;super[_0x58a2c7(0x1ba)](),this[_0x58a2c7(0x21d)]['x']=parseFloat(ArthurIsEpsteinsSon_0x69bdf9[_0x58a2c7(0x1be)][_0x58a2c7(0x1f6)](this[_0x58a2c7(0x234)])['slice'](0x0,0x1)),this[_0x58a2c7(0x21d)]['z']=parseFloat(ArthurIsEpsteinsSon_0x69bdf9[_0x58a2c7(0x1be)][_0x58a2c7(0x1f6)](this['speed'])[_0x58a2c7(0x1d3)](0x1,0x2)),ArthurIsEpsteinsSon_0x152669=this[_0x58a2c7(0x21d)]['x'],ArthurIsEpsteinsSon_0x272af9=this[_0x58a2c7(0x21d)]['z'],ArthurIsEpsteinsSon_0x69bdf9[_0x58a2c7(0x1d2)]==!![]&&(ArthurIsEpsteinsSon_0x69bdf9[_0x58a2c7(0x1f8)]['physics'][_0x58a2c7(0x1b4)][0x0][_0x58a2c7(0x21d)]=[this[_0x58a2c7(0x21d)]['x'],parseFloat(ArthurIsEpsteinsSon_0x69bdf9['noa'][_0x58a2c7(0x208)][_0x58a2c7(0x1b4)][0x0][_0x58a2c7(0x21d)]['slice'](0x1,0x2)),this['velocity']['z']]);}},_0xfa393=class extends _0xd461df{constructor(){var _0x576284=_0xb0b3ea;super(_0x576284(0x1b1),_0x576284(0x239),![],'PhaseModule'),this[_0x576284(0x1f1)]={},this[_0x576284(0x1f1)]['x']=null,this[_0x576284(0x1f1)]['y']=null,this[_0x576284(0x1f1)]['z']=null;}[_0xb0b3ea(0x1dc)](){var _0x498d38=_0xb0b3ea;super[_0x498d38(0x1dc)](),ArthurIsEpsteinsSon_0x69bdf9[_0x498d38(0x204)]=!![],ArthurIsEpsteinsSon_0x69bdf9[_0x498d38(0x1f8)][_0x498d38(0x208)][_0x498d38(0x1b4)][0x0][_0x498d38(0x225)]=0x0,this[_0x498d38(0x1f1)]['x']=parseFloat(ArthurIsEpsteinsSon_0x69bdf9[_0x498d38(0x1f8)][_0x498d38(0x23a)][_0x498d38(0x20c)](ArthurIsEpsteinsSon_0x69bdf9[_0x498d38(0x1f8)][_0x498d38(0x1ca)])[_0x498d38(0x1d3)](0x0,0x1)),this['pos']['y']=parseFloat(ArthurIsEpsteinsSon_0x69bdf9[_0x498d38(0x1f8)]['ents'][_0x498d38(0x20c)](ArthurIsEpsteinsSon_0x69bdf9[_0x498d38(0x1f8)][_0x498d38(0x1ca)])[_0x498d38(0x1d3)](0x1,0x2)),this[_0x498d38(0x1f1)]['z']=parseFloat(ArthurIsEpsteinsSon_0x69bdf9[_0x498d38(0x1f8)][_0x498d38(0x23a)][_0x498d38(0x20c)](ArthurIsEpsteinsSon_0x69bdf9['noa'][_0x498d38(0x1ca)])[_0x498d38(0x1d3)](0x2,0x3)),ArthurIsEpsteinsSon_0x69bdf9['pos']=[this[_0x498d38(0x1f1)]['x'],this['pos']['y'],this['pos']['z']];}[_0xb0b3ea(0x212)](){var _0x14ef50=_0xb0b3ea;super[_0x14ef50(0x212)](),ArthurIsEpsteinsSon_0x69bdf9[_0x14ef50(0x1f8)]['physics'][_0x14ef50(0x1b4)][0x0][_0x14ef50(0x225)]=0x1,ArthurIsEpsteinsSon_0x69bdf9[_0x14ef50(0x204)]=![];}['OnTick'](){var _0x44f0d5=_0xb0b3ea;super[_0x44f0d5(0x1ba)](),this['pos']['x']=this[_0x44f0d5(0x1f1)]['x']+parseFloat(ArthurIsEpsteinsSon_0x69bdf9[_0x44f0d5(0x1be)][_0x44f0d5(0x1f6)](0xd/(ArthurIsEpsteinsSon_0x1724ea*0x28))[_0x44f0d5(0x1d3)](0x0,0x1)),this['pos']['z']=this[_0x44f0d5(0x1f1)]['z']+parseFloat(ArthurIsEpsteinsSon_0x69bdf9[_0x44f0d5(0x1be)][_0x44f0d5(0x1f6)](0xd/(ArthurIsEpsteinsSon_0x1724ea*0x28))[_0x44f0d5(0x1d3)](0x1,0x2)),ArthurIsEpsteinsSon_0x69bdf9['noa'][_0x44f0d5(0x1ce)]['state'][_0x44f0d5(0x1e7)]==!![]&&(this[_0x44f0d5(0x1f1)]['y']=this[_0x44f0d5(0x1f1)]['y']+0.05),ArthurIsEpsteinsSon_0x69bdf9['noa'][_0x44f0d5(0x1ce)][_0x44f0d5(0x19a)]['crouch']==!![]&&(this[_0x44f0d5(0x1f1)]['y']=this[_0x44f0d5(0x1f1)]['y']-0.05),ArthurIsEpsteinsSon_0x69bdf9[_0x44f0d5(0x1f1)]=[this[_0x44f0d5(0x1f1)]['x'],this['pos']['y'],this[_0x44f0d5(0x1f1)]['z']];}},_0x2180ba=class extends _0xd461df{constructor(){var _0x10bab1=_0xb0b3ea;super(_0x10bab1(0x1e6),_0x10bab1(0x1e4),![],_0x10bab1(0x22c));}[_0xb0b3ea(0x1ba)](){var _0xbbc089=_0xb0b3ea;super['OnTick']();const _0x54dcfb=ArthurIsEpsteinsSon_0x69bdf9[_0xbbc089(0x1f8)][_0xbbc089(0x1ca)],_0x25176a=ArthurIsEpsteinsSon_0x69bdf9[_0xbbc089(0x1f8)]['ents'][_0xbbc089(0x20c)](_0x54dcfb)[_0xbbc089(0x199)](Math[_0xbbc089(0x211)]);for(var _0x3b6d8d=0x0;_0x3b6d8d==0x0;){_0x25176a[0x1]++;if(_0x25176a[0x1]>=ArthurIsEpsteinsSon_0x69bdf9[_0xbbc089(0x1f8)][_0xbbc089(0x23a)][_0xbbc089(0x20c)](_0x54dcfb)[_0xbbc089(0x199)](Math[_0xbbc089(0x211)])[0x1]+0x78)return;if(ArthurIsEpsteinsSon_0x69bdf9[_0xbbc089(0x1f8)]['world'][_0xbbc089(0x1f0)](..._0x25176a)!==0x0)for(var _0x3e0d55=0x0;_0x3e0d55==0x0;){_0x25176a[0x1]++;if(ArthurIsEpsteinsSon_0x69bdf9[_0xbbc089(0x1f8)][_0xbbc089(0x1d7)][_0xbbc089(0x1f0)](..._0x25176a)==0x0){ArthurIsEpsteinsSon_0x69bdf9['noa']['ents']['setPosition'](_0x54dcfb,[parseFloat(ArthurIsEpsteinsSon_0x69bdf9['noa']['ents'][_0xbbc089(0x20c)](_0x54dcfb)[_0xbbc089(0x1d3)](0x0,0x1)),parseFloat(_0x25176a[0x1])-0x1,parseFloat(ArthurIsEpsteinsSon_0x69bdf9['noa']['ents'][_0xbbc089(0x20c)](_0x54dcfb)[_0xbbc089(0x1d3)](0x2,0x3))]),ArthurIsEpsteinsSon_0x69bdf9['noa'][_0xbbc089(0x208)][_0xbbc089(0x1b4)][0x0][_0xbbc089(0x18d)]([0x0,0x8,0x0]);return;}}}}},_0x45c992=class extends _0xd461df{constructor(){var _0x242b52=_0xb0b3ea;super(_0x242b52(0x21b),_0x242b52(0x1d8),![],_0x242b52(0x193)),this['pos']={},this[_0x242b52(0x1f1)]['x']=null,this[_0x242b52(0x1f1)]['y']=null,this['pos']['z']=null;}[_0xb0b3ea(0x1dc)](){var _0x114487=_0xb0b3ea;super[_0x114487(0x1dc)](),ArthurIsEpsteinsSon_0x69bdf9[_0x114487(0x1a0)][_0x114487(0x1b8)]=![],ArthurIsEpsteinsSon_0x69bdf9[_0x114487(0x1f8)][_0x114487(0x208)]['bodies'][0x0][_0x114487(0x225)]=0x0,this[_0x114487(0x1f1)]['x']=parseFloat(ArthurIsEpsteinsSon_0x69bdf9[_0x114487(0x1f8)]['ents'][_0x114487(0x20c)](ArthurIsEpsteinsSon_0x69bdf9[_0x114487(0x1f8)][_0x114487(0x1ca)])['slice'](0x0,0x1)),this[_0x114487(0x1f1)]['y']=parseFloat(ArthurIsEpsteinsSon_0x69bdf9[_0x114487(0x1f8)][_0x114487(0x23a)][_0x114487(0x20c)](ArthurIsEpsteinsSon_0x69bdf9['noa']['playerEntity'])[_0x114487(0x1d3)](0x1,0x2)),this['pos']['z']=parseFloat(ArthurIsEpsteinsSon_0x69bdf9[_0x114487(0x1f8)]['ents'][_0x114487(0x20c)](ArthurIsEpsteinsSon_0x69bdf9['noa'][_0x114487(0x1ca)])[_0x114487(0x1d3)](0x2,0x3));}[_0xb0b3ea(0x1ba)](){var _0x1ed730=_0xb0b3ea;super[_0x1ed730(0x1ba)](),ArthurIsEpsteinsSon_0x69bdf9[_0x1ed730(0x1a0)][_0x1ed730(0x1b8)]=![],ArthurIsEpsteinsSon_0x69bdf9[_0x1ed730(0x1f8)][_0x1ed730(0x1ce)][_0x1ed730(0x19a)][_0x1ed730(0x1de)]==!![]&&(this[_0x1ed730(0x1f1)]['x']=this[_0x1ed730(0x1f1)]['x']+parseFloat(ArthurIsEpsteinsSon_0x69bdf9[_0x1ed730(0x1be)]['calculateMovement2D'](0.3)[_0x1ed730(0x1d3)](0x0,0x1)),this[_0x1ed730(0x1f1)]['z']=this[_0x1ed730(0x1f1)]['z']+parseFloat(ArthurIsEpsteinsSon_0x69bdf9[_0x1ed730(0x1be)][_0x1ed730(0x1f6)](0.3)[_0x1ed730(0x1d3)](0x1,0x2))),ArthurIsEpsteinsSon_0x69bdf9['noa'][_0x1ed730(0x1ce)][_0x1ed730(0x19a)]['sprint']==![]&&(this['pos']['x']=this['pos']['x']+parseFloat(ArthurIsEpsteinsSon_0x69bdf9[_0x1ed730(0x1be)][_0x1ed730(0x1f6)](0.2)[_0x1ed730(0x1d3)](0x0,0x1)),this['pos']['z']=this[_0x1ed730(0x1f1)]['z']+parseFloat(ArthurIsEpsteinsSon_0x69bdf9[_0x1ed730(0x1be)]['calculateMovement2D'](0.2)['slice'](0x1,0x2))),ArthurIsEpsteinsSon_0x69bdf9['noa']['inputs'][_0x1ed730(0x19a)]['jump']==!![]&&(this[_0x1ed730(0x1f1)]['y']=this[_0x1ed730(0x1f1)]['y']+0.2),ArthurIsEpsteinsSon_0x69bdf9['noa'][_0x1ed730(0x1ce)][_0x1ed730(0x19a)][_0x1ed730(0x198)]==!![]&&(this[_0x1ed730(0x1f1)]['y']=this['pos']['y']-0.2),ArthurIsEpsteinsSon_0x69bdf9[_0x1ed730(0x1f8)][_0x1ed730(0x23a)]['setPosition'](ArthurIsEpsteinsSon_0x69bdf9['noa'][_0x1ed730(0x1ca)],[this[_0x1ed730(0x1f1)]['x'],this[_0x1ed730(0x1f1)]['y'],this[_0x1ed730(0x1f1)]['z']]);}['OnDisabled'](){var _0x3e6223=_0xb0b3ea;super[_0x3e6223(0x212)](),ArthurIsEpsteinsSon_0x69bdf9[_0x3e6223(0x1f8)][_0x3e6223(0x208)][_0x3e6223(0x1b4)][0x0][_0x3e6223(0x225)]=0x1,ArthurIsEpsteinsSon_0x69bdf9['genericPlayerState'][_0x3e6223(0x1b8)]=!![];}},_0x6f1f7=class extends _0xd461df{constructor(){super('KeyF','Killaura',![],'KillauraModule');}['OnEnabled'](){var _0x1b5121=_0xb0b3ea;super[_0x1b5121(0x1dc)](),ArthurIsEpsteinsSon_0x593e48=!![],setTimeout(ArthurIsEpsteinsSon_0x69bdf9[_0x1b5121(0x1be)][_0x1b5121(0x229)],Math[_0x1b5121(0x211)](Math[_0x1b5121(0x238)]*0x64));}[_0xb0b3ea(0x212)](){ArthurIsEpsteinsSon_0x593e48=![];}},_0x5b75dd=class extends _0xd461df{constructor(){var _0x57063d=_0xb0b3ea;super(_0x57063d(0x192),'Autoclicker',![],_0x57063d(0x1fb));}[_0xb0b3ea(0x1dc)](){var _0x2bb6bb=_0xb0b3ea;super[_0x2bb6bb(0x1dc)](),ArthurIsEpsteinsSon_0x2f526d=!![],setTimeout(ArthurIsEpsteinsSon_0x69bdf9[_0x2bb6bb(0x1be)]['autoclicker'],Math[_0x2bb6bb(0x211)](Math[_0x2bb6bb(0x238)]*0x64));}[_0xb0b3ea(0x212)](){super['OnDisabled'](),ArthurIsEpsteinsSon_0x2f526d=![];}},_0x33663c=class extends _0xd461df{constructor(){super('KeyM','Notifications',!![],'NotificationsModule');}[_0xb0b3ea(0x1dc)](){var _0x31cc5d=_0xb0b3ea;super[_0x31cc5d(0x1dc)](),ArthurIsEpsteinsSon_0x2c816d=!![];}[_0xb0b3ea(0x212)](){var _0xcfeb00=_0xb0b3ea;super[_0xcfeb00(0x212)](),ArthurIsEpsteinsSon_0x2c816d=![];}},_0x2f88e5=class extends _0x4aedac{constructor(){var _0x400e8e=_0xb0b3ea;super(_0x400e8e(0x1b0),_0x400e8e(0x1da),![],_0x400e8e(0x1a7));}[_0xb0b3ea(0x212)](){var _0x4f4bd7=_0xb0b3ea;super[_0x4f4bd7(0x212)](),ArthurIsEpsteinsSon_0x69bdf9['newcrosshair']=prompt(_0x4f4bd7(0x224),'>}');}},_0x176212=class extends _0xd461df{constructor(){var _0x593803=_0xb0b3ea;super('KeyL',_0x593803(0x1e5),!![],'HideUiModule');}[_0xb0b3ea(0x1dc)](){var _0x560845=_0xb0b3ea;super[_0x560845(0x1dc)](),document[_0x560845(0x1a4)](_0x560845(0x1b5))[_0x560845(0x222)]['visibility']='visible';}[_0xb0b3ea(0x212)](){var _0x193a5e=_0xb0b3ea;super['OnDisabled'](),document[_0x193a5e(0x1a4)](_0x193a5e(0x1b5))['style'][_0x193a5e(0x1c0)]=_0x193a5e(0x1a5);}},_0x471f1a=class{constructor(_0x5d6009){this['modules']=_0x5d6009;}[_0xb0b3ea(0x19f)](){var _0x7d1602=_0xb0b3ea;ArthurIsEpsteinsSon_0x3089ab=this[_0x7d1602(0x1f4)],ArthurIsEpsteinsSon_0x69bdf9[_0x7d1602(0x1be)]['showToast'](_0x7d1602(0x1c3)),setInterval(this[_0x7d1602(0x1ea)],ArthurIsEpsteinsSon_0x1724ea);}[_0xb0b3ea(0x1ea)](){var _0x572e2e=_0xb0b3ea;if(ArthurIsEpsteinsSon_0x69bdf9['blackholeinjection']==!![])for(const _0x4227aa of ArthurIsEpsteinsSon_0x3089ab){_0x4227aa['type']==_0x572e2e(0x18e)&&(IsKeyUp(_0x4227aa[_0x572e2e(0x1a1)])==!![]&&(_0x4227aa['enabled']=!_0x4227aa['enabled'],_0x4227aa[_0x572e2e(0x19c)]==!![]&&(_0x4227aa[_0x572e2e(0x1dc)](),ArthurIsEpsteinsSon_0x69bdf9[_0x572e2e(0x1be)][_0x572e2e(0x20d)](btoa(_0x4227aa[_0x572e2e(0x1cb)]+atob('IGVuYWJsZWQh')))),_0x4227aa['enabled']==![]&&(_0x4227aa[_0x572e2e(0x212)](),ArthurIsEpsteinsSon_0x69bdf9[_0x572e2e(0x1be)]['showToast'](btoa(_0x4227aa['name']+atob(_0x572e2e(0x232)))))),_0x4227aa['enabled']==!![]&&_0x4227aa[_0x572e2e(0x1ba)]()),_0x4227aa['type']==_0x572e2e(0x194)&&(IsKeyDown(_0x4227aa[_0x572e2e(0x1a1)])==!![]&&(_0x4227aa[_0x572e2e(0x19c)]=!_0x4227aa[_0x572e2e(0x19c)],_0x4227aa['enabled']==!![]&&(_0x4227aa[_0x572e2e(0x1dc)](),ArthurIsEpsteinsSon_0x69bdf9[_0x572e2e(0x1be)][_0x572e2e(0x20d)](btoa(_0x4227aa[_0x572e2e(0x1cb)]+atob(_0x572e2e(0x1c9))))),_0x4227aa['enabled']==![]&&(_0x4227aa[_0x572e2e(0x212)](),ArthurIsEpsteinsSon_0x69bdf9[_0x572e2e(0x1be)][_0x572e2e(0x20d)](btoa(_0x4227aa[_0x572e2e(0x1cb)]+atob('IGRpc2FibGVkIQ=='))))),IsKeyUp(_0x4227aa[_0x572e2e(0x1a1)])==!![]&&(_0x4227aa[_0x572e2e(0x19c)]=!_0x4227aa['enabled'],_0x4227aa[_0x572e2e(0x19c)]==!![]&&(_0x4227aa['OnEnabled'](),ArthurIsEpsteinsSon_0x69bdf9[_0x572e2e(0x1be)][_0x572e2e(0x20d)](btoa(_0x4227aa[_0x572e2e(0x1cb)]+atob(_0x572e2e(0x1c9))))),_0x4227aa[_0x572e2e(0x19c)]==![]&&(_0x4227aa[_0x572e2e(0x212)](),ArthurIsEpsteinsSon_0x69bdf9[_0x572e2e(0x1be)]['showToast'](btoa(_0x4227aa['name']+atob(_0x572e2e(0x232)))))),_0x4227aa[_0x572e2e(0x19c)]==!![]&&_0x4227aa[_0x572e2e(0x1ba)]());}}},_0x537e87=class extends _0x471f1a{constructor(){super([new _0x4701ac(),new _0xfa393(),new _0x33663c(),new _0x2f88e5(),new _0x176212(),new _0x45c992(),new _0x5b75dd(),new _0x6f1f7(),new _0x2180ba()]);}},_0x40290f=new _0x537e87();_0x40290f[_0xb0b3ea(0x19f)]();function _0x1814e8(){var _0x280add=_0xb0b3ea;ArthurIsEpsteinsSon_0x69bdf9[_0x280add(0x1e0)]==!![]&&(document[_0x280add(0x20b)]('CrossHair')[0x0]!==undefined&&(document[_0x280add(0x20b)]('CrossHair')[0x0][_0x280add(0x1f5)]=ArthurIsEpsteinsSon_0x69bdf9['newcrosshair'])),ArthurIsEpsteinsSon_0x69bdf9[_0x280add(0x204)]==!![]&&ArthurIsEpsteinsSon_0x69bdf9[_0x280add(0x1f8)][_0x280add(0x23a)][_0x280add(0x19d)](ArthurIsEpsteinsSon_0x69bdf9['noa'][_0x280add(0x1ca)],ArthurIsEpsteinsSon_0x69bdf9[_0x280add(0x1f1)]),ArthurIsEpsteinsSon_0x69bdf9['usesetspeedworkaround']==!![]&&(ArthurIsEpsteinsSon_0x69bdf9[_0x280add(0x1d2)]==!![]&&(ArthurIsEpsteinsSon_0x69bdf9[_0x280add(0x1f8)]['physics'][_0x280add(0x1b4)][0x0][_0x280add(0x21d)]=[ArthurIsEpsteinsSon_0x152669,parseFloat(ArthurIsEpsteinsSon_0x69bdf9[_0x280add(0x1f8)]['physics'][_0x280add(0x1b4)][0x0][_0x280add(0x21d)][_0x280add(0x1d3)](0x1,0x2)),ArthurIsEpsteinsSon_0x272af9]));}setInterval(_0x1814e8);})());
