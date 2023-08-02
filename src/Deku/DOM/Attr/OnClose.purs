module Deku.DOM.Attr.OnClose where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnClose = OnClose

instance Attr anything OnClose (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnClose bothValues = unsafeAttribute $ Both
    { key: "close", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "close", value: cb' value })
instance Attr anything OnClose  Cb  where
  attr OnClose value = unsafeAttribute $ This
    { key: "close", value: cb' value }
instance Attr anything OnClose (Event.Event  Cb ) where
  attr OnClose eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "close", value: cb' value }

instance Attr anything OnClose (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnClose bothValues = unsafeAttribute $ Both
    { key: "close", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "close", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnClose  (Effect Unit)  where
  attr OnClose value = unsafeAttribute $ This
    { key: "close", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnClose (Event.Event  (Effect Unit) ) where
  attr OnClose eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "close", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnClose (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnClose bothValues = unsafeAttribute $ Both
    { key: "close", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "close", value: cb' (Cb (const value)) }
    )
instance Attr anything OnClose  (Effect Boolean)  where
  attr OnClose value = unsafeAttribute $ This
    { key: "close", value: cb' (Cb (const value)) }
instance Attr anything OnClose (Event.Event  (Effect Boolean) ) where
  attr OnClose eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "close", value: cb' (Cb (const value)) }

type OnCloseEffect =
  forall element
   . Attr element OnClose (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnClose (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnClose bothValues = unsafeAttribute $ Both
    { key: "close", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "close", value: unset' })
instance Attr everything OnClose  Unit  where
  attr OnClose _ = unsafeAttribute $ This { key: "close", value: unset' }
instance Attr everything OnClose (Event.Event  Unit ) where
  attr OnClose eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "close", value: unset' }
