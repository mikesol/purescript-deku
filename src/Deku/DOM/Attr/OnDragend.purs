module Deku.DOM.Attr.OnDragend where

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

data OnDragend = OnDragend

instance Attr anything OnDragend (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnDragend bothValues = unsafeAttribute $ Both (pure 
    { key: "dragend", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dragend", value: cb' value })
instance Attr anything OnDragend (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnDragend (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dragend", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dragend", value: cb' value })
instance Attr anything OnDragend  Cb  where
  attr OnDragend value = unsafeAttribute $ This $ pure $
    { key: "dragend", value: cb' value }
instance Attr anything OnDragend (Event.Event  Cb ) where
  attr OnDragend eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "dragend", value: cb' value }

instance Attr anything OnDragend (ST.ST Global.Global  Cb ) where
  attr OnDragend iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "dragend", value: cb' value }

instance Attr anything OnDragend (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnDragend bothValues = unsafeAttribute $ Both (pure 
    { key: "dragend", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "dragend", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnDragend (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnDragend (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dragend", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "dragend", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnDragend  (Effect Unit)  where
  attr OnDragend value = unsafeAttribute $ This $ pure $
    { key: "dragend", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnDragend (Event.Event  (Effect Unit) ) where
  attr OnDragend eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "dragend", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnDragend (ST.ST Global.Global  (Effect Unit) ) where
  attr OnDragend iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "dragend", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnDragend (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnDragend bothValues = unsafeAttribute $ Both (pure 
    { key: "dragend", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "dragend", value: cb' (Cb (const value)) }
    )
instance Attr anything OnDragend (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnDragend (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dragend", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "dragend", value: cb' (Cb (const value)) }
    )
instance Attr anything OnDragend  (Effect Boolean)  where
  attr OnDragend value = unsafeAttribute $ This $ pure $
    { key: "dragend", value: cb' (Cb (const value)) }
instance Attr anything OnDragend (Event.Event  (Effect Boolean) ) where
  attr OnDragend eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "dragend", value: cb' (Cb (const value)) }

instance Attr anything OnDragend (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnDragend iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "dragend", value: cb' (Cb (const value)) }

instance Attr everything OnDragend (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnDragend bothValues = unsafeAttribute $ Both (pure 
    { key: "dragend", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "dragend", value: unset' })
instance Attr everything OnDragend (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnDragend (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "dragend", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "dragend", value: unset' })
instance Attr everything OnDragend  Unit  where
  attr OnDragend _ = unsafeAttribute $ This $ pure $
    { key: "dragend", value: unset' }
instance Attr everything OnDragend (Event.Event  Unit ) where
  attr OnDragend eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "dragend", value: unset' }

instance Attr everything OnDragend (ST.ST Global.Global  Unit ) where
  attr OnDragend iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "dragend", value: unset' }
