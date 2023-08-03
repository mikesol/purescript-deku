module Deku.DOM.Attr.OnLoadstart where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnLoadstart = OnLoadstart

instance Attr anything OnLoadstart (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnLoadstart bothValues = unsafeAttribute $ Both
    { key: "loadstart", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "loadstart", value: cb' value })
instance Attr anything OnLoadstart  Cb  where
  attr OnLoadstart value = unsafeAttribute $ This $ pure $
    { key: "loadstart", value: cb' value }
instance Attr anything OnLoadstart (Event.Event  Cb ) where
  attr OnLoadstart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "loadstart", value: cb' value }

instance Attr anything OnLoadstart (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnLoadstart bothValues = unsafeAttribute $ Both
    { key: "loadstart", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "loadstart", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnLoadstart  (Effect Unit)  where
  attr OnLoadstart value = unsafeAttribute $ This $ pure $
    { key: "loadstart", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnLoadstart (Event.Event  (Effect Unit) ) where
  attr OnLoadstart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "loadstart", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnLoadstart (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnLoadstart bothValues = unsafeAttribute $ Both
    { key: "loadstart", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "loadstart", value: cb' (Cb (const value)) }
    )
instance Attr anything OnLoadstart  (Effect Boolean)  where
  attr OnLoadstart value = unsafeAttribute $ This $ pure $
    { key: "loadstart", value: cb' (Cb (const value)) }
instance Attr anything OnLoadstart (Event.Event  (Effect Boolean) ) where
  attr OnLoadstart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "loadstart", value: cb' (Cb (const value)) }

type OnLoadstartEffect =
  forall element
   . Attr element OnLoadstart (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnLoadstart (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnLoadstart bothValues = unsafeAttribute $ Both
    { key: "loadstart", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "loadstart", value: unset' })
instance Attr everything OnLoadstart  Unit  where
  attr OnLoadstart _ = unsafeAttribute $ This $ pure $
    { key: "loadstart", value: unset' }
instance Attr everything OnLoadstart (Event.Event  Unit ) where
  attr OnLoadstart eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "loadstart", value: unset' }
