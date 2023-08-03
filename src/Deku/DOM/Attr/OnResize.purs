module Deku.DOM.Attr.OnResize where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnResize = OnResize

instance Attr anything OnResize (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnResize bothValues = unsafeAttribute $ Both (pure 
    { key: "resize", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "resize", value: cb' value })
instance Attr anything OnResize  Cb  where
  attr OnResize value = unsafeAttribute $ This $ pure $
    { key: "resize", value: cb' value }
instance Attr anything OnResize (Event.Event  Cb ) where
  attr OnResize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "resize", value: cb' value }

instance Attr anything OnResize (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnResize bothValues = unsafeAttribute $ Both (pure 
    { key: "resize", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "resize", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnResize  (Effect Unit)  where
  attr OnResize value = unsafeAttribute $ This $ pure $
    { key: "resize", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnResize (Event.Event  (Effect Unit) ) where
  attr OnResize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "resize", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnResize (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnResize bothValues = unsafeAttribute $ Both (pure 
    { key: "resize", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "resize", value: cb' (Cb (const value)) }
    )
instance Attr anything OnResize  (Effect Boolean)  where
  attr OnResize value = unsafeAttribute $ This $ pure $
    { key: "resize", value: cb' (Cb (const value)) }
instance Attr anything OnResize (Event.Event  (Effect Boolean) ) where
  attr OnResize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "resize", value: cb' (Cb (const value)) }

type OnResizeEffect =
  forall element
   . Attr element OnResize (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnResize (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnResize bothValues = unsafeAttribute $ Both (pure 
    { key: "resize", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "resize", value: unset' })
instance Attr everything OnResize  Unit  where
  attr OnResize _ = unsafeAttribute $ This $ pure $ { key: "resize", value: unset' }
instance Attr everything OnResize (Event.Event  Unit ) where
  attr OnResize eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "resize", value: unset' }
