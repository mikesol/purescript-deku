module Deku.Pursx where

import Prelude

import Control.Monad.ST.Class (liftST)
import Data.Array as Array
import Data.Array.ST as STArray
import Data.Foldable (foldr)
import Data.String as String
import Data.Symbol (class IsSymbol, reflectSymbol)
import Deku.Core (DOMInterpret, DekuOutcome(..), Nut(..), PSR(..), eltAttribution, thunker)
import Deku.Interpret (toDekuElement)
import Deku.JSFinalizationRegistry (oneOffFinalizationRegistry)
import Deku.Path (symbolsToArray)
import Deku.Path as Path
import Deku.PathWalker (MElement)
import Deku.PathWalker as PW
import Deku.Pursx.Unsafe (unsafeMakePursx)
import Deku.PursxParser as PxP
import Deku.UnsafeDOM (cloneTemplate, toTemplate)
import Effect.Uncurried (EffectFn4, mkEffectFn2, runEffectFn1, runEffectFn2, runEffectFn3, runEffectFn4)
import Literals.Undefined (undefined)
import Prim.RowList as RL
import Type.Proxy (Proxy(..))
import Unsafe.Coerce (unsafeCoerce)

makePursx
  :: forall (html :: Symbol) p pl r rl plr path scrunched
   . IsSymbol html
  => PxP.PXStart "~" " " html r p
  => RL.RowToList r rl
  => RL.RowToList p pl
  => Path.SymbolsToArray rl
  => Path.RLReverses pl plr
  => Path.Process plr path
  => Path.Scrunch path scrunched
  => PW.PathWalker scrunched r
  => Proxy html
  -> { | r }
  -> Nut
makePursx = makePursx' (Proxy :: _ "~")

makePursx'
  :: forall verb (html :: Symbol) p pl r rl plr path scrunched
   . IsSymbol html
  => IsSymbol verb
  => PxP.PXStart verb " " html r p
  => RL.RowToList r rl
  => RL.RowToList p pl
  => Path.SymbolsToArray rl
  => Path.RLReverses pl plr
  => Path.Process plr path
  => Path.Scrunch path scrunched
  => PW.PathWalker scrunched r
  => Proxy verb
  -> Proxy html
  -> { | r }
  -> Nut
makePursx' _ _ r = Nut $ mkEffectFn2
  \ps@(PSR psr)
   di  ->
    do
      let
        rlProxy = Proxy :: _ rl
        htmlProxy = Proxy :: _ html
        scrunch = Proxy :: _ scrunched
        syms = symbolsToArray rlProxy
        html = foldr (\pat h -> String.replaceAll (String.Pattern ("~" <> pat <> "~")) (String.Replacement "") h) (reflectSymbol htmlProxy) syms
      eltX <- runEffectFn1 toTemplate html
      elt <- runEffectFn1 cloneTemplate eltX
      let unsafeMElement = unsafeCoerce { p: undefined, e: elt }
      runEffectFn3 eltAttribution ps di (toDekuElement elt)
      runEffectFn4 (PW.walk :: EffectFn4 (Proxy scrunched) { | r } DOMInterpret MElement Unit) scrunch r di unsafeMElement
      unsubs <- liftST $ STArray.new
      when (not (Array.null psr.unsubs)) do
        void $ liftST $ STArray.pushAll psr.unsubs unsubs
      runEffectFn2 oneOffFinalizationRegistry elt (thunker unsubs)
      pure $ DekuElementOutcome (toDekuElement elt)


infixr 5 makePursx as ~~
infixr 5 unsafeMakePursx as ~!~
