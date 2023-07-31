module Deku.DOM.Attr.OnBeforematch where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnBeforematch = OnBeforematch

instance Deku.Attribute.Attr everything OnBeforematch Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "beforematch", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnBeforematch
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "beforematch", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnBeforematchEffect =
  forall element
   . Deku.Attribute.Attr element OnBeforematch (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnBeforematch Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "beforematch", value: _ } <<<
    Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnBeforematch (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "beforematch", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
