module Deku.DOM.Attr.OnFormdata where

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

data OnFormdata = OnFormdata

instance Attr anything OnFormdata (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnFormdata bothValues = unsafeAttribute $ Both (pure 
    { key: "formdata", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "formdata", value: cb' value })
instance Attr anything OnFormdata (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnFormdata (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "formdata", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "formdata", value: cb' value })
instance Attr anything OnFormdata  Cb  where
  attr OnFormdata value = unsafeAttribute $ This $ pure $
    { key: "formdata", value: cb' value }
instance Attr anything OnFormdata (Event.Event  Cb ) where
  attr OnFormdata eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "formdata", value: cb' value }

instance Attr anything OnFormdata (ST.ST Global.Global  Cb ) where
  attr OnFormdata iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "formdata", value: cb' value }

instance Attr anything OnFormdata (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnFormdata bothValues = unsafeAttribute $ Both (pure 
    { key: "formdata", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "formdata", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnFormdata (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnFormdata (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "formdata", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "formdata", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnFormdata  (Effect Unit)  where
  attr OnFormdata value = unsafeAttribute $ This $ pure $
    { key: "formdata", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnFormdata (Event.Event  (Effect Unit) ) where
  attr OnFormdata eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "formdata", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnFormdata (ST.ST Global.Global  (Effect Unit) ) where
  attr OnFormdata iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "formdata", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnFormdata (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnFormdata bothValues = unsafeAttribute $ Both (pure 
    { key: "formdata", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "formdata", value: cb' (Cb (const value)) }
    )
instance Attr anything OnFormdata (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnFormdata (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "formdata", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "formdata", value: cb' (Cb (const value)) }
    )
instance Attr anything OnFormdata  (Effect Boolean)  where
  attr OnFormdata value = unsafeAttribute $ This $ pure $
    { key: "formdata", value: cb' (Cb (const value)) }
instance Attr anything OnFormdata (Event.Event  (Effect Boolean) ) where
  attr OnFormdata eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "formdata", value: cb' (Cb (const value)) }

instance Attr anything OnFormdata (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnFormdata iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "formdata", value: cb' (Cb (const value)) }

instance Attr everything OnFormdata (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnFormdata bothValues = unsafeAttribute $ Both (pure 
    { key: "formdata", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "formdata", value: unset' })
instance Attr everything OnFormdata (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnFormdata (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "formdata", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "formdata", value: unset' })
instance Attr everything OnFormdata  Unit  where
  attr OnFormdata _ = unsafeAttribute $ This $ pure $
    { key: "formdata", value: unset' }
instance Attr everything OnFormdata (Event.Event  Unit ) where
  attr OnFormdata eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "formdata", value: unset' }

instance Attr everything OnFormdata (ST.ST Global.Global  Unit ) where
  attr OnFormdata iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "formdata", value: unset' }
