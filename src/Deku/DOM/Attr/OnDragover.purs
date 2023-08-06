module Deku.DOM.Attr.OnDragover where

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

data OnDragover = OnDragover

instance Attr anything OnDragover (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnDragover bothValues = unsafeAttribute $ Both (pure 
    { key: "dragover", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "dragover", value: cb' value })
instance Attr anything OnDragover (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnDragover (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dragover", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "dragover", value: cb' value })
instance Attr anything OnDragover  Cb  where
  attr OnDragover value = unsafeAttribute $ This $ pure $
    { key: "dragover", value: cb' value }
instance Attr anything OnDragover (Event.Event  Cb ) where
  attr OnDragover eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "dragover", value: cb' value }

instance Attr anything OnDragover (ST.ST Global.Global  Cb ) where
  attr OnDragover iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "dragover", value: cb' value }

instance Attr anything OnDragover (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnDragover bothValues = unsafeAttribute $ Both (pure 
    { key: "dragover", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "dragover", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnDragover (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnDragover (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dragover", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "dragover", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnDragover  (Effect Unit)  where
  attr OnDragover value = unsafeAttribute $ This $ pure $
    { key: "dragover", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnDragover (Event.Event  (Effect Unit) ) where
  attr OnDragover eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "dragover", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnDragover (ST.ST Global.Global  (Effect Unit) ) where
  attr OnDragover iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "dragover", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnDragover (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnDragover bothValues = unsafeAttribute $ Both (pure 
    { key: "dragover", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "dragover", value: cb' (Cb (const value)) }
    )
instance Attr anything OnDragover (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnDragover (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "dragover", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "dragover", value: cb' (Cb (const value)) }
    )
instance Attr anything OnDragover  (Effect Boolean)  where
  attr OnDragover value = unsafeAttribute $ This $ pure $
    { key: "dragover", value: cb' (Cb (const value)) }
instance Attr anything OnDragover (Event.Event  (Effect Boolean) ) where
  attr OnDragover eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "dragover", value: cb' (Cb (const value)) }

instance Attr anything OnDragover (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnDragover iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "dragover", value: cb' (Cb (const value)) }

instance Attr everything OnDragover (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnDragover bothValues = unsafeAttribute $ Both (pure 
    { key: "dragover", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "dragover", value: unset' })
instance Attr everything OnDragover (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnDragover (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "dragover", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "dragover", value: unset' })
instance Attr everything OnDragover  Unit  where
  attr OnDragover _ = unsafeAttribute $ This $ pure $
    { key: "dragover", value: unset' }
instance Attr everything OnDragover (Event.Event  Unit ) where
  attr OnDragover eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "dragover", value: unset' }

instance Attr everything OnDragover (ST.ST Global.Global  Unit ) where
  attr OnDragover iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "dragover", value: unset' }
