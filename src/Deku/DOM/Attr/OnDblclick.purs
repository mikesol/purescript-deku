module Deku.DOM.Attr.OnDblclick where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnDblclick = OnDblclick

instance Attr anything OnDblclick (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnDblclick bothValues = unsafeAttribute $ Both
    { key: "dblclick", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "dblclick", value: cb' value })
instance Attr anything OnDblclick  Cb  where
  attr OnDblclick value = unsafeAttribute $ This $ pure $
    { key: "dblclick", value: cb' value }
instance Attr anything OnDblclick (Event.Event  Cb ) where
  attr OnDblclick eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "dblclick", value: cb' value }

instance Attr anything OnDblclick (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnDblclick bothValues = unsafeAttribute $ Both
    { key: "dblclick", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "dblclick", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnDblclick  (Effect Unit)  where
  attr OnDblclick value = unsafeAttribute $ This $ pure $
    { key: "dblclick", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnDblclick (Event.Event  (Effect Unit) ) where
  attr OnDblclick eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "dblclick", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnDblclick (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnDblclick bothValues = unsafeAttribute $ Both
    { key: "dblclick", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "dblclick", value: cb' (Cb (const value)) }
    )
instance Attr anything OnDblclick  (Effect Boolean)  where
  attr OnDblclick value = unsafeAttribute $ This $ pure $
    { key: "dblclick", value: cb' (Cb (const value)) }
instance Attr anything OnDblclick (Event.Event  (Effect Boolean) ) where
  attr OnDblclick eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "dblclick", value: cb' (Cb (const value)) }

type OnDblclickEffect =
  forall element
   . Attr element OnDblclick (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnDblclick (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnDblclick bothValues = unsafeAttribute $ Both
    { key: "dblclick", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "dblclick", value: unset' })
instance Attr everything OnDblclick  Unit  where
  attr OnDblclick _ = unsafeAttribute $ This $ pure $
    { key: "dblclick", value: unset' }
instance Attr everything OnDblclick (Event.Event  Unit ) where
  attr OnDblclick eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "dblclick", value: unset' }
