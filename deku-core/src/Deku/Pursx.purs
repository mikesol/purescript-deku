module Deku.Pursx where

import Data.Reflectable (class Reflectable, reflectType)
import Deku.Core (Nut)
import Deku.Pursx.Unsafe (class PursxToElement, unsafeMakePursx, unsafeMakePursx')
import Prim.RowList as RL
import Type.Proxy (Proxy(..))
import Deku.PursxParser as PxP

psx
  :: forall (html :: Symbol)
   . Reflectable html String
  => PxP.PXStart "~" " " html () ()
  => PursxToElement RL.Nil ()
  => Proxy html
  -> Nut
psx px = makePursx px {}

makePursx
  :: forall (html :: Symbol) p r rl
   . Reflectable html String
  => PxP.PXStart "~" " " html r p
  => RL.RowToList r rl
  => PursxToElement rl r
  => Proxy html
  -> { | r }
  -> Nut
makePursx = makePursx' (Proxy :: _ "~")

makePursx'
  :: forall verb (html :: Symbol) p r rl
   . Reflectable html String
  => Reflectable verb String
  => PxP.PXStart verb " " html r p
  => RL.RowToList r rl
  => PursxToElement rl r
  => Proxy verb
  -> Proxy html
  -> { | r }
  -> Nut
makePursx' verb html = unsafeMakePursx' (reflectType verb) (reflectType html)

infixr 5 makePursx as ~~
infixr 5 unsafeMakePursx as ~!~
