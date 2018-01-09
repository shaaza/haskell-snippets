
1. Compile using GHC for buliding. All execs need Main module. with a function in it.
2. Cabal: package manager. All repos on Hackage (official).
3. Stack: another package manager over. stack new project-name --resolver lts-9
4. Directory structure mirrors module name X.Y.Z === X -> Y -> Z
5. Change project-name.cabal, stack build -- fetches all deps and builds.
6. stack exec <executable-name> (name is defined in .cabal file)
7. import Network.Wreq (get), import Network.Wreq, import qualified Network.Wreq as W (get), import qualified Network.Wreq as W
8. Have files that only import and selectively export - renames the namespace/qualification
9. import Table(..) - to import type and constructors. Without the (..), doesn't expose constructors.
