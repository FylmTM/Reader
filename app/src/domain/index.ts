export type User = {
    username: string;
}

export type Category = {
    id: number;
    name: string;
}

export type FeedKind =
    | 'RSS';

export type Feed = {
    id: number;
    kind: FeedKind;
    title: string;
    link: string;
    feed: string;
}

export type MediaType = {
    mime: string;
}

export type Post = {
    id: number;
    link: string;
    title: string;
    date: string;
    content: string | undefined;
    media_type: string | undefined;
    media_link: string | undefined;
    comments_link: string | undefined;
}
