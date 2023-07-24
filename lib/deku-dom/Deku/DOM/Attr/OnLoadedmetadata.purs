module Deku.DOM.Attr.OnLoadedmetadata where

import Control.Semigroupoid ((<<<))
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event

data OnLoadedmetadata = OnLoadedmetadata

instance Deku.Attribute.Attr everything OnLoadedmetadata Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "onLoadedmetadata", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnLoadedmetadata
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onLoadedmetadata", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnLoadedmetadataEffect =
  forall element
   . Deku.Attribute.Attr element OnLoadedmetadata (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnLoadedmetadata Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onLoadedmetadata", value: _ } <<<
    Deku.Attribute.cb'
