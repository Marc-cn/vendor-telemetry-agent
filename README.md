**“TRUST NOTHING” BUILD CTF**

**THE SCENARIO**

A vendor handed you this telemetry agent and said “just build it and ship it.”  Do not trust them. You don’t need to write code; you have to decide whether you would put their build on a production machine. You have a repo, a compiler and 30 minutes.

**SET UP & BUILD (DO THIS FIRST, TOGETHER AS A TEAM)**

1.	Get your own copy. Open github.com/Marc-cn/vendor-telemetry-agent and sign in to GitHub. Click the green Use this template button (top-right) → Create a new repository. Name it ctf-team1 (your team number/name), leave it under your own account, make it public or private, click Create repository.
Each team works on its own copy, one person creates it and adds the other two as collaborators if needed (Settings → Collaborators).
2.	Open a Codespace (your free cloud Linux machine). On your new repo page, click the green < > Code button → Codespaces tab → Create codespace on main.
Wait ~30–60 s while it builds, it installs the compiler for you. A VS Code editor opens in your browser with a terminal at the bottom. You type into that terminal.
3.	Build it. In the terminal, type these four lines one at a time, pressing Enter after each:
./configure
source ./env.sh      # the vendor's setup step
make
./telemetry-agent
It worked if the last line reads recorded: boot. Now the CTF begins.

**YOUR MISSION**

–	Build the project so it runs (you just did this).

–	Prove the resulting binary is exactly what the source says it is.

–	Find everything that would make you refuse to ship it, then fix what you can.

**HINTS**

–	You wouldn’t ship a vendor’s code without reading it, so read it, rebuild it, and question the tools.

–	make is lazy. What does it decide not to do? Try make clean && make and compare the hash.

–	Read what the setup step does to your shell. All of it: cat env.sh.

–	“The flag is there” is not the same as “the flag works.”

–	Question the compiler: which -a gcc. Anything that seems unusual, unexpected, or raises a question is likely worth investigating.

**SCORING**

–	+1  for each issue you find and can explain.

–	+2  if you also fix it (found + fixed stack).

–	+3  if your binary’s SHA-256 matches another team’s, a reproducible build.

Check your hash with  sha256sum telemetry-agent   (shasum -a 256 telemetry-agent on macOS).
**HOW YOU PRESENT (NO WRITING REQUIRED)**
When time is up, your team comes to the front and talks the room through your terminal. Walk us through:
1.	What you found, name each issue and say why it would stop you shipping.
2.	What you fixed, show the before vs. after in the code or the build.
3.	Your hash, read out your SHA-256. Did it match any other team? If not, why not?

