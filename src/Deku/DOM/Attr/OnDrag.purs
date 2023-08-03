module Deku.DOM.Attr.OnDrag where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnDrag = OnDrag

instance Attr anything OnDrag (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnDrag bothValues = unsafeAttribute $ Both (pure 
    { key: "drag", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "drag", value: cb' value })
instance Attr anything OnDrag (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnDrag (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "drag", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "drag", value: cb' value })
instance Attr anything OnDrag  Cb  where
  attr OnDrag value = unsafeAttribute $ This $ pure $
    { key: "drag", value: cb' value }
instance Attr anything OnDrag (Event.Event  Cb ) where
  attr OnDrag eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "drag", value: cb' value }

instance Attr anything OnDrag (ST.ST Global.Global  Cb ) where
  attr OnDrag stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "drag", value: cb' value }

instance Attr anything OnDrag (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnDrag bothValues = unsafeAttribute $ Both (pure 
    { key: "drag", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "drag", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnDrag (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnDrag (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "drag", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "drag", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnDrag  (Effect Unit)  where
  attr OnDrag value = unsafeAttribute $ This $ pure $
    { key: "drag", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnDrag (Event.Event  (Effect Unit) ) where
  attr OnDrag eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "drag", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnDrag (ST.ST Global.Global  (Effect Unit) ) where
  attr OnDrag stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "drag", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnDrag (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnDrag bothValues = unsafeAttribute $ Both (pure 
    { key: "drag", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "drag", value: cb' (Cb (const value)) }
    )
instance Attr anything OnDrag (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnDrag (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "drag", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "drag", value: cb' (Cb (const value)) }
    )
instance Attr anything OnDrag  (Effect Boolean)  where
  attr OnDrag value = unsafeAttribute $ This $ pure $
    { key: "drag", value: cb' (Cb (const value)) }
instance Attr anything OnDrag (Event.Event  (Effect Boolean) ) where
  attr OnDrag eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "drag", value: cb' (Cb (const value)) }

instance Attr anything OnDrag (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnDrag stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "drag", value: cb' (Cb (const value)) }

instance Attr everything OnDrag (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnDrag bothValues = unsafeAttribute $ Both (pure  { key: "drag", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "drag", value: unset' })
instance Attr everything OnDrag (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnDrag (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->   { key: "drag", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "drag", value: unset' })
instance Attr everything OnDrag  Unit  where
  attr OnDrag _ = unsafeAttribute $ This $ pure $ { key: "drag", value: unset' }
instance Attr everything OnDrag (Event.Event  Unit ) where
  attr OnDrag eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "drag", value: unset' }

instance Attr everything OnDrag (ST.ST Global.Global  Unit ) where
  attr OnDrag stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "drag", value: unset' }
